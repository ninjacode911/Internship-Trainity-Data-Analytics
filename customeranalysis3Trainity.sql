CREATE DATABASE JobDataAnalysis;
USE JobDataAnalysis;

CREATE TABLE job_data (
  job_id INT AUTO_INCREMENT PRIMARY KEY,
  actor_id INT,
  event VARCHAR(255),
  language VARCHAR(255),
  time_spent INT,
  org VARCHAR(255),
  ds DATE
);

INSERT INTO job_data (actor_id, event, language, time_spent, org, ds)
VALUES (21, 'skip', 'English', 15, 'A', '2020-11-30');

INSERT INTO job_data (actor_id, event, language, time_spent, org, ds)
VALUES (22, 'transfer', 'Arabic', 25, 'B', '2020-11-30');

INSERT INTO job_data (actor_id, event, language, time_spent, org, ds)
VALUES (23, 'decision', 'Persian', 20, 'C', '2020-11-29');

INSERT INTO job_data (actor_id, event, language, time_spent, org, ds)
VALUES (23, 'transfer', 'Persian', 22, 'D', '2020-11-28');

INSERT INTO job_data (actor_id, event, language, time_spent, org, ds)
VALUES (25, 'decision', 'Hindi', 11, 'B', '2020-11-28');

INSERT INTO job_data (actor_id, event, language, time_spent, org, ds)
VALUES (11, 'decision', 'French', 104, 'D', '2020-11-27');

INSERT INTO job_data (actor_id, event, language, time_spent, org, ds)
VALUES (23, 'skip', 'Persian', 56, 'A', '2020-11-26');

INSERT INTO job_data (actor_id, event, language, time_spent, org, ds)
VALUES (20, 'transfer', 'Italian', 45, 'C', '2020-11-25');

SELECT *
FROM job_data
WHERE (actor_id, event, language, time_spent, org, ds) IN (
    SELECT actor_id, event, language, time_spent, org, ds
    FROM job_data
    GROUP BY actor_id, event, language, time_spent, org, ds
    HAVING COUNT(*) > 1
);
