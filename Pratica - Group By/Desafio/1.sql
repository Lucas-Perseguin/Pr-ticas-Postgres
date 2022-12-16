SELECT schools.name AS school, courses.name AS course, COUNT(educations."userId") AS "studentsCount" FROM educations
  JOIN courses ON educations."courseId" = courses.id
  JOIN schools ON educations."schoolId" = schools.id
  GROUP BY schools.id, courses.id
  ORDER BY "studentsCount" DESC
  LIMIT 3;