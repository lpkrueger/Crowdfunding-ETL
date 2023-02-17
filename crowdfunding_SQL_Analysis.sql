-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
SELECT cf_id, backers_count FROM campaign
WHERE (outcome = 'live')
ORDER BY (cf_id) DESC;

-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
SELECT cf_id, COUNT(cf_id) 
FROM backers
GROUP BY cf_id
ORDER BY cf_id DESC;

-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
SELECT cont.first_name, 
	cont.last_name, 
	cont.email,
	(camp.goal - camp.pledged) as "Remaining Goal Amount"
INTO email_contacts_remaining_goal_amount
FROM contacts as cont
INNER JOIN campaign as camp
ON cont.contact_id = camp.contact_id
WHERE (outcome = 'live')
ORDER BY "Remaining Goal Amount" DESC;
-- Check the table


-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 
SELECT back.email,
	back.first_name, 
	back.last_name, 
	camp.cf_id,
	camp.company_name,
	camp.description,
	camp.end_date,
	(camp.goal - camp.pledged) as "Left of Goal"
INTO email_backers_remaining_goal_amount
FROM backers as back
INNER JOIN campaign as camp
ON back.cf_id = camp.cf_id
WHERE (outcome = 'live')
ORDER BY last_name; --DESC;
	-- lpkrueger: The module says display in descending order, but the example image shows is it in ascending order. 


-- Check the table


