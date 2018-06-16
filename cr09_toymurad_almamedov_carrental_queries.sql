
-- Which cars do our clients rent, and who are they

SELECT `client`.`first_name`,`client`.`last_name`,`reservation`.`reservation_id`,`car`.`licence_plate_number`,`car`.`FK_car_model_id` FROM `client`
JOIN `reservation` ON `reservation`.`reservation_id` = `client`.`client_id`
JOIN `car` ON `car`.`licence_plate_number` = `reservation`.`FK_licence_plate_number`



-- Where our clients drop cars, and who are they
SELECT `client`.`first_name`,`client`.`last_name`,`reservation`.`reservation_id`,`invoice`.`invoice_number`,`rent_builidng_location`.`location` FROM `client`
JOIN `reservation` ON `reservation`.`FK_client_id` = `client`.`client_id`
JOIN `invoice` ON `invoice`.`FK_reservation_id` = `reservation`.`reservation_id`
JOIN `drop` ON `drop`.`FK_invoice_number` = `invoice`.`invoice_number`
JOIN `rent_builidng_location` ON `rent_builidng_location`.`rent_building_id` = `drop`.`FK_rent_building_id`


-- Which cars came from which supplier
SELECT `car`.`FK_car_model_id`, `cars_supplier`.`name` FROM `cars_supplier`
JOIN `car` ON `car`.`FK_supplier_id` = `cars_supplier`.`supplier_id`


-- Which models from which supplier
SELECT `car_model`.`car_model_id`, `car_manufacturer`.`make` FROM `car_model`
JOIN `car_manufacturer` ON `car_manufacturer`.`car_manufacturer_id` = `car_model`.`FK_manufacturer_id`


-- Show Additional charges
SELECT `client`.`first_name`, `client`.`last_name`, `reservation`.`reservation_id`, `invoice`.`invoice_number`, `additional_charges`.`amount`, `additional_charges`.`description` FROM `client`
JOIN `reservation` ON `reservation`.`reservation_id` = `client`.`client_id`
JOIN `car` ON `car`.`licence_plate_number` = `reservation`.`FK_licence_plate_number`
JOIN `invoice` ON `invoice`.`FK_reservation_id` = `reservation`.`reservation_id`
JOIN `drop` ON `drop`.`FK_invoice_number` = `invoice`.`invoice_number`
LEFT JOIN `additional_charges` ON `additional_charges`.`FK_drop_id` = `drop`.`drop_id`