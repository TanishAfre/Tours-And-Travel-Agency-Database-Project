-----------------------------------------------First Table---------------------------------------------------------------------------
-----------------------------------------------Travel_Company------------------------------------------------------------------------
CREATE TABLE `tanishdb`.`travel_company` ( `Company_ID` VARCHAR(5) NOT NULL , 
										   `Company_Name` VARCHAR(35) NOT NULL , 
										   `Address` VARCHAR(40) NOT NULL , 
										   `Contact_Number_Company` INT(10) NOT NULL , 
										   PRIMARY KEY (`Company_ID`(5))) ENGINE = InnoDB;
-------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------Insert in First Table----------------------------------------------------------------
INSERT INTO `travel_company` (`Company_ID`, `Company_Name`, `Address`, `Contact_Number_Company`) 
       VALUES ('159EG', 'Expedia Group', 'St. Dowel Streat US', '159753456'), 
	          ('917BH', 'Booking Holdings', 'Gandhi Nagar India', '917364825');
-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

----------------------------------------------Second Table---------------------------------------------------------------------------
----------------------------------------------Tourists-------------------------------------------------------------------------------
CREATE TABLE `tanishdb`.`tourists` ( `Traveler_ID` VARCHAR(5) NOT NULL , 
									 `Tourist_Name` VARCHAR(50) NOT NULL , 
									 `Tourist_Contact` INT(10) NOT NULL , 
									 `Number_of_travelers` INT(2) NOT NULL , 
									 `Company_ID` VARCHAR(5) NOT NULL , 
									 PRIMARY KEY (`Traveler_ID`(5))) ENGINE = InnoDB;
									 
ALTER TABLE `tourists` ADD INDEX( `Company_ID`);
--------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------Insert in second table-----------------------------------------------------------------
INSERT INTO `tourists` (`Traveler_ID`, `Tourist_Name`, `Tourist_Contact`, `Number_of_travelers`, `Company_ID`) 
       VALUES ('AB123', 'Tanish Afre',   '123456789', '3', '159EG'), 
	          ('YX321', 'Annas Khan',    '884365162', '1', '917BH'), 
			  ('GH951', 'Joseph Mophet', '955191609', '7', '159EG'), 
			  ('YD015', 'Marin Trench',  '276627757', '1', '159EG'), 
			  ('DK564', 'Avijot Singh',  '456816597', '3', '159EG'), 
			  ('SJ988', 'Alexa Amazon',  '854654815', '2', '159EG'), 
			  ('TA722', 'Mari Juan',     '726195122', '5', '159EG');
---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			  
----------------------------------------------Third Table------------------------------------------------------------------------------
----------------------------------------------Travel_Plan------------------------------------------------------------------------------
CREATE TABLE `tanishdb`.`travel_plans` ( `Plan_ID` int(3) NOT NULL ,  
										 `Travel_Location` VARCHAR(20) NOT NULL ,  
										 `Start_Date` DATE NOT NULL ,  
										 `End_Date` DATE NOT NULL ,  
										 `Cost` INT NOT NULL ,    
										 PRIMARY KEY  (`Plan_ID`)) ENGINE = InnoDB;
---------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------Insert in third table -------------------------------------------------------------------
INSERT INTO `travel_plans` (`Plan_ID`, `Travel_Location`, `Start_Date`, `End_Date`, `Cost`) 
	   VALUES ('001', 'New Your', '2021-05-31', '2021-06-04', '2000'), 
		      ('002', 'Delhi', '2021-08-27', '2021-08-30', '1050'), 
			  ('003', 'Mumbai', '2021-05-20', '2021-06-05', '1200'), 
			  ('004', 'Toronto', '2021-08-10', '2021-08-20', '1500');
---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

----------------------------------------------Fouth Table------------------------------------------------------------------------------
----------------------------------------------Itinerary--------------------------------------------------------------------------------
CREATE TABLE `tanishdb`.`itinerary` ( `Plan_ID` INT(3) NOT NULL , 
									  `Traveler_ID` VARCHAR(5) NOT NULL , 
									  `Hotel_name` VARCHAR(15) NOT NULL , 
									  `Room_Number` INT(2) NOT NULL , 
									  `Hotel_Contact` INT(10) NOT NULL , 
									  PRIMARY KEY (`Plan_ID`, `Traveler_ID`)) ENGINE = InnoDB;
---------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------Insert in fourth table-------------------------------------------------------------------
INSERT INTO `itinerary` (`Plan_ID`, `Traveler_ID`, `Hotel_name`, `Room_Number`, `Hotel_Contact`) 
	   VALUES ('1', 'AB123', 'Stark', '31', '888999444'), 
			  ('2', 'YX321', 'Lodhi', '97', '955161962'), 
			  ('3', 'GH951', 'Taj', '4', '984649162'), 
			  ('1', 'YD015', 'Stark', '32', '621953216'), 
			  ('3', 'DK564', 'Taj', '5', '462191196'), 
			  ('4', 'SJ988', 'Mandala', '36', '951621986'), 
			  ('4', 'TA722', 'Mandala', '37', '152351651');
---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

----------------------------------------------Fifth Table------------------------------------------------------------------------------
----------------------------------------------Cargo------------------------------------------------------------------------------------
CREATE TABLE `tanishdb`.`cargo` ( `Vehical_Number` VARCHAR(5) NOT NULL , 
								  `Traveler_ID` VARCHAR(5) NOT NULL , 
								  `Vehical_Mode` VARCHAR(15) NOT NULL , 
								  `Mode_Name` VARCHAR(25) NOT NULL , 
								  `Gate` VARCHAR(3) NOT NULL , 
								  PRIMARY KEY (`Vehical_Number`)) ENGINE = InnoDB;
								  
ALTER TABLE `cargo` ADD INDEX( `Traveler_ID`);
---------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------Insert in fifth table--------------------------------------------------------------------
INSERT INTO `cargo` (`Vehical_Number`, `Traveler_ID`, `Vehical_Mode`, `Mode_Name`, `Gate`) 
	   VALUES ('BA180', 'AB123', 'Aeroplane', 'British Airways', 'T2'), 
			  ('EM720', 'YX321', 'Aeroplane', 'Emirates', 'T6'), 
			  ('15786', 'GH951', 'Train', 'Indian Express', 'P12'), 
			  ('132NY', 'YD015', 'Bus', 'NYB Limited', 'S3'), 
			  ('18258', 'DK564', 'Train', 'Indian Express', 'P12'), 
			  ('BA786', 'SJ988', 'Aeroplane', 'British Airways', 'T3'), 
			  ('BA691', 'TA722', 'Aeroplane', 'British Airways', 'T6');
---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------			  



-- Queries --

--Q1 – The companies want names, contact details and number of travellers traveling, to confirm the number of travellers traveling. Write down an SQL query helping them out.
	   SELECT Tourist_Name, Tourist_Contact, Number_of_travelers FROM `tourists`;
	   
--Q2 – While talking to the tourists, the company found out that tourist with name Tanish Afre is traveling with one other. Write SQL query to update his Number_of_travelers column to 2.
	   UPDATE `tourists` SET `Number_of_travelers`= 2 WHERE Tourist_Name = "Tanish Afre";
	   
--Q3 – Write a SQL query to find out which travel company has travel plans for Delhi city.
   	   SELECT Company_Name FROM travel_company WHERE Company_ID = (SELECT Company_ID FROM tourists WHERE Traveler_ID = (SELECT Traveler_ID FROM itinerary WHERE Plan_ID = (SELECT Plan_ID FROM travel_plans WHERE Travel_location = "Delhi")));

--Q4 – Mari Juan just called the company and told them that her flight gate has changed from T6 to T8. Write SQL statement to make the following changes.
	   UPDATE cargo SET Gate = "T8" WHERE Traveler_ID = (SELECT Traveler_ID FROM tourists WHERE Tourist_Name = "Mari Juan");
	   
--Q5 – The company wants to know the end date of Annas Khan as they want to surprise him with a party on his birthday. Write a query to get the end date.
	   SELECT End_Date FROM travel_plans WHERE Plan_ID = (SELECT Plan_ID FROM itinerary WHERE Traveler_ID = (SELECT Traveler_ID FROM tourists WHERE Tourist_Name = "Annas Khan"));
	   
--Q6 – There was a lost bag found in Taj Hotel room 4. Help finding out the name and contact number of the baggage owner.
	   SELECT Tourist_Name, tourist_Contact FROM tourists WHERE Traveler_ID = (SELECT Traveler_ID FROM itinerary WHERE Hotel_name = "Taj" AND Room_number = 4);
	   
--Q7 – For a survey, find out how many travellers travel in an aeroplane. 
	   SELECT COUNT(Vehical_Mode) FROM cargo WHERE Vehical_Mode = "Aeroplane";
	   
--Q8 – Marin Trench wants to contact the hotel as she wants them to provide non-veg food. Write SQL query helping her find the contact details.
	   SELECT Hotel_Contact FROM itinerary WHERE Traveler_ID = (SELECT Traveler_ID FROM tourists WHERE Tourist_Name = "Marin Trench");
	   
--Q9 – Write SQL statement to display all details of tourists traveling with Expedia Group to different location.
	   SELECT * FROM tourists WHERE Company_ID = (SELECT Company_ID FROM travel_company WHERE Company_Name = "Expedia Group");
	   
--Q10 – Write an SQL query to display names of tourist and company through which the tourists are traveling.
	    SELECT Tourist_Name, Company_Name FROM tourists JOIN travel_company USING(Company_ID) WHERE tourists.Company_ID = travel_company.Company_ID;
		
--Q11 – There is a new company established recently named as Trivago. Insert into the table with ID  812TV address Longford St. Dublin and contact as 545864897
	    INSERT INTO `travel_company` (`Company_ID`, `Company_Name`, `Address`, `Contact_Number_Company`) VALUES ('812TV', 'Trivago', 'Longford St. Dublin ', '545864897');
		
--Q12 – Due to the recent covid crisis the same company had to be shut down as it was facing a lot of losses. Write the SQL query to delete the data. 
 	    DELETE FROM travel_company WHERE Company_ID = "812TV";
		
--Q13 – Company has already declared the cost of the tour and doesn’t want it to be shown in the tables. Hence write an query to remove the column cost from the table plan. 
	    ALTER TABLE travel_plans DROP COLUMN Cost;













