# 📝 Student Performance Analysis Dashboard (SQL & Power BI)
This project explores the impact of various student related factors on academic performance using a dynamic, interactive Power BI dahsboard. It analyzes a synthetic a synthetic dataset to uncover insights related to GPA trends across demographic and behavioral dimensions such as study time, parental support, extracurriculars, and attendance.

---

## 📊 Dashboard Features:
* **Dynamic Parameter Selection:** Users can choose from multiple categorical factors (e.g., Gender, Parental Education, Tutoring) to visualize their impact on student GPA.
* **Interactive KPI Cards:**
    * Average GPA displayed with a gauge and a 3.0 performance benchmark.
    * Student Count >= 3.0 GPA KPI card to quickly analyze the number of students surpassing the GPA benchmark.
    * Category Counts dynamically update based on selected parameters.
* **Visual Insights**:
    * Bar charts show GPA averages across selected demographic groups.
    * Scatter plot reveal relationships between GPA and continuous variables such as weekly study hours and absences.
* **User-Controlled Filtering:** Slicers for chart parameters allow for flexible data exploration.
  
---

## 📁 Dataset Fields:
* StudentID
* Age, Gender, Ethnicity
* ParentalEducation, ParentalSupport
* WeeklyStudyTime, # of Absences
* Tutoring, Extracurricular, Sports, Music, Volunteering
* GPA, GradeLetter

The dataset is synthetic and was created for the purpose of academic data exploration.

---

## 🧮 SQL Analysis:
The repository also includes a SQL script (Student_Performance_Data SQL Query) used for:
* Exploring trends between GPA and weekly study time.
* Creating summary tables for average GPA by group.
* Filtering students with GPA above or below a certain threshold.
* Supporting data aggregation for Power BI visuals.
The SQL file is included to demonstrate backend analysis and how it supports the Power BI dashboard.

---

## 💡 Key Insights:
* Students with some college or high school parental education had slightly higher average GPAs than those with bachelor's degrees or higher.
* Weekly study time showed a moderate positive trend with GPA.
* Higher absences correlated negatively with GPA, as visualized through scatter plots and regression lines.
* Only **328 out of 2,392** students had a GPA of 3.0 or higher.

---

## 🛠️ Tools Used:
* **Power BI** for dashboard development and data visualization
* **T-SQL (SQL Server)** for exploratory queries and data shaping
* **DAX** for calculated measures (e.g., count of GPA >= 3.0)
* **Excel/CSV** for initial data import

---

## 🚀 How to Use:
1. Open the .pbix file in Power BI Desktop.
2. Use the slicers on the left to explore how each parameter affects GPA.
3. Review the SQL script to understand the data transformation process.
4. Hover over visuals to view tooltips and deeper insights.
5. Export or publish the dashboard for reporting purposes.

---

## 📄 License:
This project is open for educational and portfolio use. If you adapt it to your own portfolio, please include attribution.
