CREATE TABLE car
(
	id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1, NO CACHE ), 
	buying VARCHAR(10),
	maint VARCHAR(10), 
	doors VARCHAR(10), 
	persons VARCHAR(10), 
	lug_boot VARCHAR(10), 
	safety VARCHAR(10),
	decision VARCHAR(10) 
);

load client from C:/Users/db2admin/Desktop/car.data of del insert into car(buying,maint,doors,persons,lug_boot,safety,decision);