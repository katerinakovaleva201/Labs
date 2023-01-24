SELECT *
FROM titleauthor
LEFT JOIN authors
ON titleauthor.au_id = authors.au_id
LEFT JOIN titles
ON titleauthor.title_id = titles.title_id
LEFT JOIN publishers
ON titles.pub_id = publishers.pub_id
