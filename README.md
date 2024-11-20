![화면 캡처 2024-11-20 173454](https://github.com/user-attachments/assets/61556f7c-452d-41e4-ab73-0bf26e9a4843)

<br/><br/><br/>
 #### _____________________프로시저  학습 시작
      USE market_db;
      
      
      DROP PROCEDURE IF EXISTS ifproc1;
      
      delimiter $$
      	CREATE PROCEDURE ifproc1()
      	BEGIN
      		IF 100 = 100 THEN
      			SELECT '100은 100과 같습니다.';
      		END IF;
      	END $$
      delimiter ;
      
      call ifproc1();

<br/><br/>

* ##  스토어 프로시저를 만들 때 
### SQL 편집에서 만들기 <br/><br/>
>*  delimiter$$<br/>
>*  delimiter ;

* ### 스토어 프로시저 마우스 오른쪽 create 만들고  X로 끄면서 저장 apply 
> ####  개발 환경 툴이 지원되어야 함.

<br/>
      
      USE `market_db`;
      DROP procedure IF EXISTS `ifproc2`;
      
      USE `market_db`;
      DROP procedure IF EXISTS `market_db`.`ifproc2`;
      ;
      
      DELIMITER $$
      USE `market_db`$$
      CREATE DEFINER=`dbuser`@`%` PROCEDURE `ifproc2`()
      BEGIN
      		declare myNum int;
              set myNum = 200;
      		IF myNum = 100 THEN
      			SELECT '100입니다.';
      		else
      			select '100이 아닙니다.';
      		END IF;
      	END$$
      
      DELIMITER ;
      ;

      <br/>
 -------------------------------------------     


      USE `market_db`;
      DROP procedure IF EXISTS `ifproc2`;
      
      USE `market_db`;
      DROP procedure IF EXISTS `market_db`.`ifproc2`;
      ;
      
      DELIMITER $$
      USE `market_db`$$
      CREATE DEFINER=`dbuser`@`%` PROCEDURE `ifproc2`()
      BEGIN
      		declare myNum int;
              set myNum = 100;
      		IF myNum = 100 THEN
      			SELECT '100입니다.';
      		else
      			select '100이 아닙니다.';
      		END IF;
      	END$$
      
      DELIMITER ;
      ;
      <br/><br/>



<br/><br/>


<br/><br/>



>* ![화면 캡처 2024-11-04 144041](https://github.com/user-attachments/assets/4de6ca10-b686-4996-b519-7b6ce3d018e3)
<br/><br/>


<br/><br/>
>* ![화면 캡처 2024-11-04 142650](https://github.com/user-attachments/assets/6fea189d-81ef-45e4-b7a1-fc0b59826430)

<br/><br/>


<br/><br/>
>* ![화면 캡처 2024-11-04 143250](https://github.com/user-attachments/assets/3e2a2758-5dcb-4ec1-8423-b4903e3e53a8)



<br/><br/>
