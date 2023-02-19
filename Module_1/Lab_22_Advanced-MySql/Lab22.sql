USE ppub;

# Step 1: Calculate the royalty of each sale for each author and the advance for each author and publication
SELECT a.au_id,
	t.title_id,
	t.advance*ta.royaltyper/100 AS advance, 
	t.price*s.qty*t.royalty/100* ta.royaltyper/100 AS royalties
FROM titles t
INNER JOIN titleauthor ta ON t.title_id=ta.title_id
INNER JOIN authors a ON a.au_id=ta.au_id
INNER JOIN sales s ON s.title_id=t.title_id;

# Step 2: Aggregate the total royalties for each title and author
SELECT summary.au_id, summary.title_id, SUM(summary.advance + summary.royalties) AS sum_royalties, advance
FROM (
	SELECT a.au_id,
		t.title_id,
		t.advance*ta.royaltyper/100 AS advance, 
		t.price*s.qty*t.royalty/100*ta.royaltyper/100 AS royalties
	FROM titles t
	INNER JOIN titleauthor ta
	ON t.title_id=ta.title_id
	INNER JOIN authors a
	ON a.au_id=ta.au_id
	INNER JOIN sales s
	ON s.title_id=t.title_id
) AS summary
GROUP BY au_id, summary.title_id;

# Step 3: Calculate the total profits of each author
SELECT au_id, tot_royalties+advance as tot_profit
FROM(
WITH step2 AS (
SELECT advancetable.title_id, advancetable.au_id, advancetable.advance,
		(advancetable.price * sales.qty * advancetable.royalty / 100 * advancetable.royaltyper / 100) as sales_royalty
FROM (
		SELECT titleauthor.title_id, titleauthor.au_id, titles.price,
		titles.royalty, titleauthor.royaltyper,
			(titles.advance*titleauthor.royaltyper/100) as advance
		FROM titleauthor
		LEFT JOIN titles
		ON titleauthor.title_id = titles.title_id
        WHERE advance IS NOT NULL) as advancetable
LEFT JOIN sales
ON advancetable.title_id = sales.title_id
)
Select title_id, au_id, advance, sum(sales_royalty) as tot_royalties
FROM step2
GROUP BY title_id, au_id
) step3
ORDER BY tot_profit DESC;
