-- Create an event called expire_events to remove old sessions from 
-- the events_sessions table

CREATE EVENT expire_events
ON SCHEDULE EVERY 10 MINUTE 
    DO
    DELETE FROM events_sessions
    WHERE stime < CURRENT_TIMESTAMP - INTERVAL 1 DAY;