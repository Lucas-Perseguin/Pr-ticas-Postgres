SELECT education.id, education.school, education.course, job.company, job.role FROM applicants
  JOIN
    (SELECT jobs.id, companies.name AS company, roles.name AS role FROM jobs JOIN companies ON jobs."companyId" = companies.id WHERE companies.id = 10 JOIN roles ON jobs."roleId" = roles.id WHERE roles.name = 'Software Engineer' WHERE jobs.active IS TRUE)
    AS job ON applicants."jobId" = job.id
  JOIN
    (SELECT schools.id, users.id AS "userId", courses.name AS course, schools.name AS school FROM educations JOIN users ON educations."userId" = users.id JOIN courses ON educations."courseId" = courses.id JOIN schools ON educations."schoolId" = schools.id)
    AS education ON applicants."userId" = education."userId";