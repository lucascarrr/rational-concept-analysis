from ucimlrepo import fetch_ucirepo 
  
# fetch dataset 
congressional_voting_records = fetch_ucirepo(id=105) 
  
# data (as pandas dataframes) 
X = congressional_voting_records.data.features 
y = congressional_voting_records.data.targets 
  
# metadata 
print(congressional_voting_records.metadata) 
  
# variable information 
print(congressional_voting_records)
