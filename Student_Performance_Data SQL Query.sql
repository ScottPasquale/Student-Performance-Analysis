SELECT *
FROM Student_Performance_Clean_CSV;

-- What is the average GPA by gender and ethnicity?

SELECT Gender, AVG(GPA) AS Avg_GPA
FROM Student_Performance_Clean_CSV
GROUP BY Gender;

SELECT Ethnicity, AVG(GPA) AS Avg_GPA
FROM Student_Performance_Clean_CSV
GROUP BY Ethnicity
ORDER BY AVG(GPA) DESC;

-- Male Avg: 1.92 | Female Avg: 1.89
-- Other Avg: 1.95 | African American: 1.95 | Asian: 1.92 | Caucasian: 1.88


-- How does parental education levels impact GPA?

SELECT ParentalEducation, AVG(GPA) as Avg_GPA
FROM Student_Performance_Clean_CSV
GROUP BY ParentalEducation
ORDER BY AVG(GPA) DESC;

-- High School: 1.94 | Some College: 1.92 | None (Less than High School): 1.89 | Higher than Bachelors: 1.82 | Bachelors: 1.81


-- Is there a correlation between weekly study time and GPA?

SELECT CategorizedStudyTime, AVG(GPA) AS Avg_GPA
FROM (
	SELECT *,
		CASE
			WHEN ROUND(StudyTimeWeekly, 0) BETWEEN 0 AND 5 THEN '0-5 Hours'
			WHEN ROUND(StudyTimeWeekly, 0) BETWEEN 6 AND 10 THEN '6-10 Hours'
			WHEN ROUND(StudyTimeWeekly, 0) BETWEEN 11 AND 15 THEN '11-15 Hours'
			WHEN ROUND(StudyTimeWeekly, 0) BETWEEN 16 AND 20 THEN '16-20 Hours'
		END AS CategorizedStudyTime
	FROM Student_Performance_Clean_CSV
	) AS StudyTimeTable
GROUP BY CategorizedStudyTime
ORDER BY AVG(GPA) DESC;

-- Yes, there is a positive correlation between study time and average GPA.
-- 16-20 Hours: 2.12 | 11-15 Hours: 2.01 | 6-10 Hours: 1.87 | 0-5 Hours: 1.69 


-- How does parent support level affect GPA?

SELECT ParentalSupport, AVG(GPA) AS Avg_GPA
FROM Student_Performance_Clean_CSV
GROUP BY ParentalSupport
ORDER BY AVG(GPA) DESC;

-- Yes, there is a positive correlation between parental support and average GPA.
-- Very High: 2.19 | High: 2.04 | Moderate: 1.88 | Low: 1.76 | None: 1.54


-- Do students who participate in extracurricular activites have higher GPAs?

SELECT ExtraCurricularParticipation, AVG(GPA) AS Avg_GPA
FROM (
	SELECT *,
		CASE
			WHEN Extracurricular = 1 OR Sports = 1 OR Music = 1 OR Volunteering = 1 THEN 'Extracurricular'
			ELSE 'No Extracurricular'
		END AS ExtraCurricularParticipation
	FROM Student_Performance_Clean_CSV
	) AS ECP
GROUP BY ExtraCurricularParticipation
ORDER BY AVG(GPA) DESC;

-- Yes, it seems that students who participate in some sort of extracurricular activity have a higher average GPA.
-- Extracurricular: 1.97 | No Extracurricular: 1.75


-- What is the GPA difference between those who receive tutoring and those who don't?

SELECT Tutoring_Clean, AVG(GPA) AS Avg_GPA
FROM (
	SELECT *,
		CASE
			WHEN Tutoring = 1 THEN 'Receives Tutoring'
			ELSE 'No Tutoring'
		END AS Tutoring_Clean
	FROM Student_Performance_Clean_CSV
	) AS CleanTutoringTable
GROUP BY Tutoring_Clean
ORDER BY AVG(GPA) DESC;

-- Yes, students who receive tutoring tend to have higher GPAs than those who don't.
-- Tutoring Received: 2.11 | No Tutoring: 1.82


-- What is the relationship between number of absences and GPA?

SELECT Categorized_Absences, AVG(GPA) AS Avg_GPA
FROM (
	SELECT *,
		CASE
			WHEN Absences BETWEEN 0 AND 5 THEN '0-5 Absences'
			WHEN Absences BETWEEN 6 AND 10 THEN '6-10 Absences'
			WHEN Absences BETWEEN 11 AND 15 THEN '11-15 Absences'
			WHEN Absences BETWEEN 16 AND 20 THEN '16-20 Absences'
			ELSE '20+ Absences'
		END AS Categorized_Absences
	FROM Student_Performance_Clean_CSV
	) AS AbsTable
GROUP BY Categorized_Absences
ORDER BY AVG(GPA) DESC;

-- Students tend to have a higher GPA with less absences.
-- 0-5 Absences: 3.1 | 6-10 Absences: 2.6 | 11-15 Absences: 2.06 | 16-20 Absences: 1.55 | 20+ Absences: 0.88


-- Which groups of students perform best on average?

SELECT CategorizedStudyTime, ExtraCurricularParticipation, Tutoring_Clean, Categorized_Absences, AVG(GPA) AS Avg_GPA
FROM (
	SELECT *,
		CASE
			WHEN ROUND(StudyTimeWeekly, 0) BETWEEN 0 AND 5 THEN '0-5 Hours'
			WHEN ROUND(StudyTimeWeekly, 0) BETWEEN 6 AND 10 THEN '6-10 Hours'
			WHEN ROUND(StudyTimeWeekly, 0) BETWEEN 11 AND 15 THEN '11-15 Hours'
			WHEN ROUND(StudyTimeWeekly, 0) BETWEEN 16 AND 20 THEN '16-20 Hours'
		END AS CategorizedStudyTime,
		CASE
			WHEN Extracurricular = 1 OR Sports = 1 OR Music = 1 OR Volunteering = 1 THEN 'Extracurricular'
			ELSE 'No Extracurricular'
		END AS ExtraCurricularParticipation,
		CASE
			WHEN Tutoring = 1 THEN 'Receives Tutoring'
			ELSE 'No Tutoring'
		END AS Tutoring_Clean,
		CASE
			WHEN Absences BETWEEN 0 AND 5 THEN '0-5 Absences'
			WHEN Absences BETWEEN 6 AND 10 THEN '6-10 Absences'
			WHEN Absences BETWEEN 11 AND 15 THEN '11-15 Absences'
			WHEN Absences BETWEEN 16 AND 20 THEN '16-20 Absences'
			ELSE '20+ Absences'
		END AS Categorized_Absences
	FROM Student_Performance_Clean_CSV
	) AS Student_Data_Large
GROUP BY CategorizedStudyTime, ExtraCurricularParticipation, Tutoring_Clean, Categorized_Absences
ORDER BY AVG(GPA) DESC;

-- The students that tend to do the best based on aspects that they control are those that study 16-20 hours per week, participate in extracurriculars, receive tutoring, and have 0-5 absences.
-- The average GPA for these students is 3.52

SELECT Gender, Ethnicity, ParentalEducation, ParentalSupport, AVG(GPA) AS Avg_GPA
FROM Student_Performance_Clean_CSV
GROUP BY Gender, Ethnicity, ParentalEducation, ParentalSupport
ORDER BY AVG(GPA) DESC;

-- The students that tend to do the best based on aspects out of their control (Gender, Ethnicity, Parental Eduacation, and Parental Support) are females, "other" ethnicity, parents with less than a high school education, and very high parental support.
-- The average GPA for these students is 3.55
