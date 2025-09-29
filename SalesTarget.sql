CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `GFGDA3`@`%` 
    SQL SECURITY DEFINER
VIEW `northwind`.`sales_target` AS
    SELECT 
        `s`.`employeeId` AS `employeeId`,
        SUM((`o`.`quantity` * `o`.`unitPrice`)) AS `total`,
        `t`.`targetAmount` AS `tAmount`,
        ROUND(SUM((((`o`.`quantity` * `o`.`unitPrice`) / `t`.`targetAmount`) * 100)),
                2) AS `percente`
    FROM
        ((`northwind`.`salesorder` `s`
        JOIN `northwind`.`orderdetail` `o` ON ((`s`.`orderId` = `o`.`orderId`)))
        JOIN `northwind`.`target` `t` ON ((`s`.`employeeId` = `t`.`employeeId`)))
    GROUP BY `s`.`employeeId` , `tAmount`
    ORDER BY `percente` DESC