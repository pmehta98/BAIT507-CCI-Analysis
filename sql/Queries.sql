
-- Queries from Homework 2 (Queries).docx

-- Query 1: Activity Participation Summary
SELECT 
    a.activityid, 
    a.activityname, 
    COUNT(DISTINCT p.userid) AS "number of users"
FROM activity a
LEFT JOIN participation p
    ON a.activityid = p.activityid
LEFT JOIN cciuser u
    ON u.userid = p.userid
GROUP BY a.activityid, a.activityname
ORDER BY "number of users" DESC;

-- Query 2: Referrer and User Activity
WITH referral AS (
    SELECT 
        u.userid, 
        u.userfn, 
        u.userln, 
        u.referrerid, 
        r.userfn AS referrerfn, 
        r.userln AS referrerln
    FROM cciuser u
    JOIN cciuser r
        ON u.referrerid = r.userid
)
SELECT 
    r.userid AS "CCI user ID", 
    r.userfn AS "user firstname", 
    r.userln AS "user lastname", 
    COUNT(DISTINCT p1.activityid) AS "user total activity", 
    r.referrerid AS "referrer ID",
    r.referrerfn AS "referrer firstname",
    r.referrerln AS "referrer lastname",
    COUNT(DISTINCT p2.activityid) AS "referrer total activity"
FROM referral r
LEFT JOIN participation p1
    ON r.userid = p1.userid
LEFT JOIN participation p2
    ON r.referrerid = p2.userid
GROUP BY r.userid, r.userfn, r.userln, r.referrerid, r.referrerfn, r.referrerln;

-- Query 3: Current Credit Amount
WITH earned AS (
    SELECT 
        u.userid, 
        u.userfn, 
        u.userln, 
        CASE 
            WHEN SUM(a.creditearned * p.participationamount) IS NULL THEN 0
            ELSE SUM(a.creditearned * p.participationamount)
        END AS total_earned
    FROM cciuser u
    LEFT JOIN participation p
        ON u.userid = p.userid
    LEFT JOIN activity a
        ON a.activityid = p.activityid
    GROUP BY u.userid, u.userfn, u.userln
),
claimed AS (
    SELECT 
        u.userid, 
        CASE 
            WHEN SUM(r.claimedrewardamount * c.requiredcreditamount) IS NULL THEN 0
            ELSE SUM(r.claimedrewardamount * c.requiredcreditamount)
        END AS total_claimed
    FROM cciuser u
    LEFT JOIN rewardclaim r
        ON u.userid = r.userid
    LEFT JOIN carbonreward c
        ON r.rewardid = c.rewardid
    GROUP BY u.userid
)
SELECT 
    userid,
    userfn,
    userln,
    (total_earned - total_claimed) AS "current credit amount"
FROM earned
JOIN claimed
    USING(userid)
ORDER BY "current credit amount";

-- Query 4: Top Activities by Credit Earned
WITH activity_rank AS (
    SELECT 
        a.activityid, 
        a.activityname, 
        SUM(a.creditearned * p.participationamount) AS "earned amount", 
        DENSE_RANK() OVER(ORDER BY SUM(a.creditearned * p.participationamount) DESC) AS rank
    FROM activity a
    JOIN participation p
        ON a.activityid = p.activityid
    GROUP BY a.activityid, a.activityname
)
SELECT 
    a.activityid AS topactivityid,
    a.activityname,
    "earned amount",
    CASE 
        WHEN rank=1 THEN 'first'
        WHEN rank=2 THEN 'second'
        WHEN rank=3 THEN 'third'
    END AS "rank"
FROM activity_rank a
WHERE rank <= 3
ORDER BY rank;
