# 1 - Who Have Published What At Where?
SELECT p.pub_name,  p.pub_id, t.title_id, t.title, a.au_fname,  a.au_lname, ta.title_id
FROM ppub.publishers p
LEFT JOIN  ppub.titles t
ON p.pub_id=t.pub_id
LEFT JOIN  ppub.titleauthor ta
on t.title_id=ta.title_id
left join ppub.authors a
on a.au_id=ta.au_id;

# 2 - Who Have Published How Many At Where?
SELECT A.au_id, A.au_lname, A.au_fname, P.pub_name, COUNT(T.title) AS number_of_titles
FROM ppub.authors A
INNER JOIN ppub.titleauthor TA
ON TA.au_id = A.au_id
INNER JOIN ppub.titles T
ON T.title_id=TA.title_id
INNER JOIN ppub.publishers P
ON P.pub_id=T.pub_id
GROUP BY A.au_id, P.pub_name
ORDER BY number_of_titles DESC;

# 3 - Best Selling Authors
SELECT A.au_lname, SUM(T.ytd_sales)
FROM ppub.authors A
INNER JOIN ppub.titleauthor TA
ON TA.au_id = A.au_id
INNER JOIN ppub.titles T
ON T.title_id=TA.title_id
GROUP BY A.au_lname
ORDER BY SUM(T.ytd_sales) DESC
LIMIT 3;

# 4 - Best Selling Authors Ranking
SELECT A.au_lname, IFNULL(SUM(T.ytd_sales),0) AS total_sales_by_author
FROM ppub.authors A
LEFT JOIN ppub.titleauthor TA
ON TA.au_id = A.au_id
LEFT JOIN ppub.titles T
ON T.title_id=TA.title_id
GROUP BY A.au_lname
ORDER BY total_sales_by_author DESC;