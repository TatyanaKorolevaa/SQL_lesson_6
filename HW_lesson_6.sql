CREATE DATABASE HW_SQL_006;
use HW_SQL_006;


DELIMITER //
CREATE PROCEDURE second_counter(num INT)
BEGIN
	CASE
		WHEN num < 60 THEN
			SELECT CONCAT(num, ' ', 'seconds') AS Result;
        WHEN num >= 60 AND num < 3600 THEN
			SELECT CONCAT_WS(' ', num DIV 60, 'minutes', MOD(num, 60), 'seconds') AS Result;
        WHEN num >= 3600 AND num < 86400 THEN
			SELECT CONCAT_WS(' ', num DIV 3600, 'hours', MOD(num, 3600) DIV 60, 'minutes', MOD(MOD(num, 3600),60), 'seconds') AS Result;
        ELSE
			SELECT CONCAT_WS(' ', num DIV 86400, 'days', MOD(num, 86400) DIV 3600, 'hours', MOD(MOD(num, 86400),3600) DIV 60, 'minutes',
                             MOD(MOD(MOD(num, 86400),3600),60), 'seconds') AS Result;
    END CASE;
END//

DELIMITER ;
CALL second_counter(123456);  


DELIMITER //
CREATE PROCEDURE get_even(`start` INT, `end` INT)
BEGIN
	DECLARE i INT DEFAULT `start`;
    DECLARE res_str TEXT DEFAULT NULL;
    WHILE  i<=`end` DO
        IF i%2 = 0 THEN
			IF res_str IS NULL THEN
				SET res_str = concat(i);
			ELSE
				SET res_str = concat(res_str, ', ', i);
			END IF;
		END IF;
        SET i = i + 1;
    END WHILE;
	SELECT res_str;
END //
DELIMITER ;

CALL get_even(1, 10);
CALL second_counter(123456);  
