SELECT *
FROM JobOrder
WHERE COALESCE(ScheduleDate, '') <>''
ORDER BY ScheduleDate