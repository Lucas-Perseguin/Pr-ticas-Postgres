SELECT educations."userId" AS id, COUNT(educations.id) AS educations FROM educations GROUP BY educations."userId";