# Crowdfunding-ETL
Module 8, ETL - UNCCH Data Analytics Bootcamp, Spring 2023


## Project Overview

### Purpose
Independent Funding asked us to perform data analysis on their crowdfunding projects to help them identify backers who have donated to campaigns, active campaigns that haven't reached their goals yet, and contacts who they can reach out to to solicit donations to reach their crowdfunding goals. 

## Method
Using PostgreSQL & Jupyter Notebook, the crowdfunding was extracted from CSV files, transformed using Python, then loaded into tables in PostgreSQL. After which, custom SQL queries were created to generate tables to enable the crowdfunding executives to make strategic decisions and contact backers that can potentially help live campaigns reach their donation goals. 

An ERD was created to visualize each table's connections and the appropriate connections between them. 

![crowdfunding_db_relationships](/crowdfunding_db_relationships.png)
 

Sample Python code used for Deliverable #2 - Transforming and cleaning the data:
```
    # Iterate through the backers DataFrame and convert each row to a dictionary.
    values = []
    column_names = []
    # Iterate through the backers DataFrame and convert each row to a dictionary.
    for i, row in backers_info.iterrows():
        data = row[0]
        # Iterate through each dictionary (row) and get the values for each row using list comprehension.
        converted_data = json.loads(data)
        columns = [k for k,v in converted_data.items()]
        # Use a list comprehension to get the values for each row.
        row_values = [v for k, v in converted_data.items()]
        # Append the list of values for each row to a list. 
        column_names.append(columns)
        values.append(row_values)
# Print out the list of values for each row.
print(column_names[0])
print()
print(values)
```

Sample SQL query used for Deliverable #4 - SQL Analysis:
```
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
ORDER BY last_name;
```

## Results
The contact info for key donors were identified, including the remaining amount required to reach the donation goal for each campaign. 

[email_contacts_remaining_goal_amount](/email_contacts_remaining_goal_amount.csv)
[email_backers_remaining_goal_amount](/email_backers_remaining_goal_amount.csv)

