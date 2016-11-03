-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: activiti
-- ------------------------------------------------------
-- Server version	5.7.13-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `act_evt_log`
--

DROP TABLE IF EXISTS `act_evt_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_evt_log` (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_evt_log`
--

LOCK TABLES `act_evt_log` WRITE;
/*!40000 ALTER TABLE `act_evt_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_evt_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ge_bytearray`
--

DROP TABLE IF EXISTS `act_ge_bytearray`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ge_bytearray`
--

LOCK TABLES `act_ge_bytearray` WRITE;
/*!40000 ALTER TABLE `act_ge_bytearray` DISABLE KEYS */;
INSERT INTO `act_ge_bytearray` VALUES ('2',1,'D:\\apache-tomcat-8.0.36\\webapps\\Spring-activiti\\WEB-INF\\classes\\process\\leave.bpmn','1','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/test\">\n  <process id=\"leave\" name=\"My process\" isExecutable=\"true\">\n    <userTask id=\"deptleaderaudit\" name=\"éƒ¨é—¨é¢†å¯¼å®¡æ‰¹\" activiti:candidateGroups=\"éƒ¨é—¨ç»ç†\"></userTask>\n    <exclusiveGateway id=\"exclusivegateway1\" name=\"Exclusive Gateway\"></exclusiveGateway>\n    <userTask id=\"hraudit\" name=\"äººäº‹å®¡æ‰¹\" activiti:candidateGroups=\"äººäº‹\"></userTask>\n    <sequenceFlow id=\"flow3\" name=\"åŒæ„\" sourceRef=\"exclusivegateway1\" targetRef=\"hraudit\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${deptleaderapprove==\'true\'}]]></conditionExpression>\n    </sequenceFlow>\n    <userTask id=\"modifyapply\" name=\"è°ƒæ•´ç”³è¯·\" activiti:assignee=\"${applyuserid}\"></userTask>\n    <sequenceFlow id=\"flow4\" name=\"æ‹’ç»\" sourceRef=\"exclusivegateway1\" targetRef=\"modifyapply\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${deptleaderapprove==\'false\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow6\" sourceRef=\"deptleaderaudit\" targetRef=\"exclusivegateway1\"></sequenceFlow>\n    <exclusiveGateway id=\"exclusivegateway2\" name=\"Exclusive Gateway\"></exclusiveGateway>\n    <sequenceFlow id=\"flow7\" sourceRef=\"modifyapply\" targetRef=\"exclusivegateway2\"></sequenceFlow>\n    <sequenceFlow id=\"flow8\" name=\"é‡æ–°ç”³è¯·\" sourceRef=\"exclusivegateway2\" targetRef=\"deptleaderaudit\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reapply==\'true\'}]]></conditionExpression>\n    </sequenceFlow>\n    <endEvent id=\"endevent1\" name=\"End\"></endEvent>\n    <sequenceFlow id=\"flow9\" name=\"ç»“æŸæµç¨‹\" sourceRef=\"exclusivegateway2\" targetRef=\"endevent1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reapply==\'false\'}]]></conditionExpression>\n    </sequenceFlow>\n    <exclusiveGateway id=\"exclusivegateway3\" name=\"Exclusive Gateway\"></exclusiveGateway>\n    <sequenceFlow id=\"flow10\" sourceRef=\"hraudit\" targetRef=\"exclusivegateway3\"></sequenceFlow>\n    <sequenceFlow id=\"flow11\" name=\"æ‹’ç»\" sourceRef=\"exclusivegateway3\" targetRef=\"modifyapply\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${hrapprove==\'false\'}]]></conditionExpression>\n    </sequenceFlow>\n    <userTask id=\"reportback\" name=\"é”€å‡\" activiti:assignee=\"${applyuserid}\"></userTask>\n    <sequenceFlow id=\"flow12\" name=\"åŒæ„\" sourceRef=\"exclusivegateway3\" targetRef=\"reportback\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${hrapprove==\'true\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow13\" sourceRef=\"reportback\" targetRef=\"endevent1\"></sequenceFlow>\n    <startEvent id=\"startevent1\" name=\"Start\" activiti:initiator=\"${applyuserid}\"></startEvent>\n    <sequenceFlow id=\"flow14\" sourceRef=\"startevent1\" targetRef=\"deptleaderaudit\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_leave\">\n    <bpmndi:BPMNPlane bpmnElement=\"leave\" id=\"BPMNPlane_leave\">\n      <bpmndi:BPMNShape bpmnElement=\"deptleaderaudit\" id=\"BPMNShape_deptleaderaudit\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"250.0\" y=\"220.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway1\" id=\"BPMNShape_exclusivegateway1\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"535.0\" y=\"227.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"hraudit\" id=\"BPMNShape_hraudit\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"620.0\" y=\"220.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"modifyapply\" id=\"BPMNShape_modifyapply\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"503.0\" y=\"310.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway2\" id=\"BPMNShape_exclusivegateway2\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"535.0\" y=\"410.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent1\" id=\"BPMNShape_endevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"890.0\" y=\"413.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway3\" id=\"BPMNShape_exclusivegateway3\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"770.0\" y=\"228.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"reportback\" id=\"BPMNShape_reportback\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"855.0\" y=\"221.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"startevent1\" id=\"BPMNShape_startevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"140.0\" y=\"230.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"flow3\" id=\"BPMNEdge_flow3\">\n        <omgdi:waypoint x=\"575.0\" y=\"247.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"620.0\" y=\"247.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"24.0\" x=\"575.0\" y=\"247.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow4\" id=\"BPMNEdge_flow4\">\n        <omgdi:waypoint x=\"555.0\" y=\"267.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"555.0\" y=\"310.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"24.0\" x=\"555.0\" y=\"267.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow6\" id=\"BPMNEdge_flow6\">\n        <omgdi:waypoint x=\"355.0\" y=\"247.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"535.0\" y=\"247.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow7\" id=\"BPMNEdge_flow7\">\n        <omgdi:waypoint x=\"555.0\" y=\"365.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"555.0\" y=\"410.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow8\" id=\"BPMNEdge_flow8\">\n        <omgdi:waypoint x=\"535.0\" y=\"430.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"302.0\" y=\"429.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"302.0\" y=\"275.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"48.0\" x=\"361.0\" y=\"438.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow9\" id=\"BPMNEdge_flow9\">\n        <omgdi:waypoint x=\"575.0\" y=\"430.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"890.0\" y=\"430.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"48.0\" x=\"659.0\" y=\"437.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow10\" id=\"BPMNEdge_flow10\">\n        <omgdi:waypoint x=\"725.0\" y=\"247.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"770.0\" y=\"248.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow11\" id=\"BPMNEdge_flow11\">\n        <omgdi:waypoint x=\"790.0\" y=\"268.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"789.0\" y=\"337.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"608.0\" y=\"337.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"24.0\" x=\"672.0\" y=\"319.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow12\" id=\"BPMNEdge_flow12\">\n        <omgdi:waypoint x=\"810.0\" y=\"248.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"855.0\" y=\"248.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"24.0\" x=\"810.0\" y=\"248.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow13\" id=\"BPMNEdge_flow13\">\n        <omgdi:waypoint x=\"907.0\" y=\"276.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"907.0\" y=\"413.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow14\" id=\"BPMNEdge_flow14\">\n        <omgdi:waypoint x=\"175.0\" y=\"247.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"250.0\" y=\"247.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('3',1,'D:\\apache-tomcat-8.0.36\\webapps\\Spring-activiti\\WEB-INF\\classes\\process\\purchase.bpmn','1','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/test\">\n  <process id=\"purchase\" name=\"purchaseprocess\" isExecutable=\"true\">\n    <startEvent id=\"startevent1\" name=\"Start\" activiti:initiator=\"${starter}\"></startEvent>\n    <userTask id=\"purchaseAuditi\" name=\"é‡‡è´­ç»ç†å®¡æ‰¹\" activiti:candidateGroups=\"é‡‡è´­ç»ç†\"></userTask>\n    <sequenceFlow id=\"flow1\" sourceRef=\"startevent1\" targetRef=\"purchaseAuditi\"></sequenceFlow>\n    <exclusiveGateway id=\"exclusivegateway1\" name=\"Exclusive Gateway\"></exclusiveGateway>\n    <sequenceFlow id=\"flow2\" sourceRef=\"purchaseAuditi\" targetRef=\"exclusivegateway1\"></sequenceFlow>\n    <userTask id=\"updateapply\" name=\"è°ƒæ•´ç”³è¯·\" activiti:assignee=\"${starter}\"></userTask>\n    <sequenceFlow id=\"flow4\" name=\"ä¸é€šè¿‡\" sourceRef=\"exclusivegateway1\" targetRef=\"updateapply\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${purchaseauditi==\'false\'}]]></conditionExpression>\n    </sequenceFlow>\n    <exclusiveGateway id=\"exclusivegateway2\" name=\"æ˜¯å¦é‡æ–°ç”³è¯·\"></exclusiveGateway>\n    <sequenceFlow id=\"flow5\" sourceRef=\"updateapply\" targetRef=\"exclusivegateway2\"></sequenceFlow>\n    <endEvent id=\"endevent1\" name=\"End\"></endEvent>\n    <sequenceFlow id=\"flow6\" name=\"ä¸é‡æ–°ç”³è¯·\" sourceRef=\"exclusivegateway2\" targetRef=\"endevent1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${updateapply==\'false\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow7\" name=\"é‡æ–°ç”³è¯·\" sourceRef=\"exclusivegateway2\" targetRef=\"purchaseAuditi\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${updateapply==\'true\'}]]></conditionExpression>\n    </sequenceFlow>\n    <subProcess id=\"pay\" name=\"ä»˜è´¹å­æµç¨‹\">\n      <startEvent id=\"startevent2\" name=\"Start\"></startEvent>\n      <userTask id=\"financeaudit\" name=\"è´¢åŠ¡å®¡æ‰¹\" activiti:candidateGroups=\"è´¢åŠ¡ç®¡ç†å‘˜\"></userTask>\n      <sequenceFlow id=\"flow9\" sourceRef=\"startevent2\" targetRef=\"financeaudit\"></sequenceFlow>\n      <exclusiveGateway id=\"exclusivegateway3\" name=\"Exclusive Gateway\"></exclusiveGateway>\n      <sequenceFlow id=\"flow10\" sourceRef=\"financeaudit\" targetRef=\"exclusivegateway3\"></sequenceFlow>\n      <exclusiveGateway id=\"exclusivegateway4\" name=\"Exclusive Gateway\"></exclusiveGateway>\n      <sequenceFlow id=\"flow11\" name=\"é€šè¿‡\" sourceRef=\"exclusivegateway3\" targetRef=\"exclusivegateway4\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${finance==\'true\'}]]></conditionExpression>\n      </sequenceFlow>\n      <userTask id=\"manageraudit\" name=\"æ€»ç»ç†å®¡æ‰¹\" activiti:candidateGroups=\"æ€»ç»ç†\"></userTask>\n      <sequenceFlow id=\"flow12\" name=\"é‡‘é¢å¤§äº1ä¸‡\" sourceRef=\"exclusivegateway4\" targetRef=\"manageraudit\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${money>10000}]]></conditionExpression>\n      </sequenceFlow>\n      <userTask id=\"paymoney\" name=\"å‡ºçº³ä»˜æ¬¾\" activiti:candidateGroups=\"å‡ºçº³å‘˜\"></userTask>\n      <sequenceFlow id=\"flow13\" name=\"é‡‘é¢å°äº1ä¸‡\" sourceRef=\"exclusivegateway4\" targetRef=\"paymoney\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${money<10000}]]></conditionExpression>\n      </sequenceFlow>\n      <endEvent id=\"endevent2\" name=\"End\"></endEvent>\n      <sequenceFlow id=\"flow14\" sourceRef=\"paymoney\" targetRef=\"endevent2\"></sequenceFlow>\n      <exclusiveGateway id=\"exclusivegateway5\" name=\"Exclusive Gateway\"></exclusiveGateway>\n      <sequenceFlow id=\"flow15\" sourceRef=\"manageraudit\" targetRef=\"exclusivegateway5\"></sequenceFlow>\n      <endEvent id=\"errorendevent1\" name=\"æ€»ç»ç†ä¸åŒæ„\">\n        <errorEventDefinition errorRef=\"payment_reject\"></errorEventDefinition>\n      </endEvent>\n      <sequenceFlow id=\"flow17\" name=\"é€šè¿‡\" sourceRef=\"exclusivegateway5\" targetRef=\"paymoney\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${manager==\'true\'}]]></conditionExpression>\n      </sequenceFlow>\n      <endEvent id=\"errorendevent2\" name=\"è´¢åŠ¡ä¸åŒæ„\">\n        <errorEventDefinition errorRef=\"payment_reject\"></errorEventDefinition>\n      </endEvent>\n      <sequenceFlow id=\"flow18\" sourceRef=\"exclusivegateway3\" targetRef=\"errorendevent2\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${finance==\'false\'}]]></conditionExpression>\n      </sequenceFlow>\n      <sequenceFlow id=\"flow23\" sourceRef=\"exclusivegateway5\" targetRef=\"errorendevent1\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${manager==\'false\'}]]></conditionExpression>\n      </sequenceFlow>\n    </subProcess>\n    <boundaryEvent id=\"boundaryerror1\" name=\"Error\" attachedToRef=\"pay\">\n      <errorEventDefinition errorRef=\"payment_reject\"></errorEventDefinition>\n    </boundaryEvent>\n    <sequenceFlow id=\"flow19\" name=\"æ•è·å­æµç¨‹å¼‚å¸¸\" sourceRef=\"boundaryerror1\" targetRef=\"updateapply\"></sequenceFlow>\n    <sequenceFlow id=\"flow20\" name=\"è¿›å…¥ä»˜è´¹å­æµç¨‹\" sourceRef=\"exclusivegateway1\" targetRef=\"pay\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${purchaseauditi==\'true\'}]]></conditionExpression>\n    </sequenceFlow>\n    <userTask id=\"receiveitem\" name=\"æ”¶è´§ç¡®è®¤\" activiti:assignee=\"${starter}\"></userTask>\n    <sequenceFlow id=\"flow21\" sourceRef=\"pay\" targetRef=\"receiveitem\"></sequenceFlow>\n    <endEvent id=\"endevent3\" name=\"End\"></endEvent>\n    <sequenceFlow id=\"flow22\" sourceRef=\"receiveitem\" targetRef=\"endevent3\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_purchase\">\n    <bpmndi:BPMNPlane bpmnElement=\"purchase\" id=\"BPMNPlane_purchase\">\n      <bpmndi:BPMNShape bpmnElement=\"startevent1\" id=\"BPMNShape_startevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"55.0\" y=\"170.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"purchaseAuditi\" id=\"BPMNShape_purchaseAuditi\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"135.0\" y=\"160.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway1\" id=\"BPMNShape_exclusivegateway1\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"285.0\" y=\"168.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"updateapply\" id=\"BPMNShape_updateapply\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"253.0\" y=\"240.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway2\" id=\"BPMNShape_exclusivegateway2\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"167.0\" y=\"247.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent1\" id=\"BPMNShape_endevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"74.0\" y=\"250.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"pay\" id=\"BPMNShape_pay\">\n        <omgdc:Bounds height=\"321.0\" width=\"588.0\" x=\"480.0\" y=\"21.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"startevent2\" id=\"BPMNShape_startevent2\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"540.0\" y=\"101.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"financeaudit\" id=\"BPMNShape_financeaudit\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"620.0\" y=\"91.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway3\" id=\"BPMNShape_exclusivegateway3\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"770.0\" y=\"99.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway4\" id=\"BPMNShape_exclusivegateway4\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"855.0\" y=\"100.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"manageraudit\" id=\"BPMNShape_manageraudit\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"940.0\" y=\"93.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"paymoney\" id=\"BPMNShape_paymoney\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"823.0\" y=\"181.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent2\" id=\"BPMNShape_endevent2\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"858.0\" y=\"281.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway5\" id=\"BPMNShape_exclusivegateway5\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"972.0\" y=\"188.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"errorendevent1\" id=\"BPMNShape_errorendevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"975.0\" y=\"281.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"errorendevent2\" id=\"BPMNShape_errorendevent2\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"773.0\" y=\"191.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"boundaryerror1\" id=\"BPMNShape_boundaryerror1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"458.0\" y=\"253.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"receiveitem\" id=\"BPMNShape_receiveitem\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"721.0\" y=\"400.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent3\" id=\"BPMNShape_endevent3\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"871.0\" y=\"410.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"flow1\" id=\"BPMNEdge_flow1\">\n        <omgdi:waypoint x=\"90.0\" y=\"187.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"135.0\" y=\"187.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow2\" id=\"BPMNEdge_flow2\">\n        <omgdi:waypoint x=\"240.0\" y=\"187.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"285.0\" y=\"188.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow4\" id=\"BPMNEdge_flow4\">\n        <omgdi:waypoint x=\"305.0\" y=\"208.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"305.0\" y=\"240.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"36.0\" x=\"305.0\" y=\"208.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow5\" id=\"BPMNEdge_flow5\">\n        <omgdi:waypoint x=\"253.0\" y=\"267.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"207.0\" y=\"267.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow6\" id=\"BPMNEdge_flow6\">\n        <omgdi:waypoint x=\"167.0\" y=\"267.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"109.0\" y=\"267.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"60.0\" x=\"109.0\" y=\"274.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow7\" id=\"BPMNEdge_flow7\">\n        <omgdi:waypoint x=\"187.0\" y=\"247.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"187.0\" y=\"215.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"48.0\" x=\"192.0\" y=\"228.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow9\" id=\"BPMNEdge_flow9\">\n        <omgdi:waypoint x=\"575.0\" y=\"118.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"620.0\" y=\"118.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow10\" id=\"BPMNEdge_flow10\">\n        <omgdi:waypoint x=\"725.0\" y=\"118.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"770.0\" y=\"119.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow11\" id=\"BPMNEdge_flow11\">\n        <omgdi:waypoint x=\"810.0\" y=\"119.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"855.0\" y=\"120.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"24.0\" x=\"806.0\" y=\"101.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow12\" id=\"BPMNEdge_flow12\">\n        <omgdi:waypoint x=\"895.0\" y=\"120.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"940.0\" y=\"120.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"66.0\" x=\"879.0\" y=\"86.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow13\" id=\"BPMNEdge_flow13\">\n        <omgdi:waypoint x=\"875.0\" y=\"140.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"875.0\" y=\"181.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"66.0\" x=\"821.0\" y=\"163.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow14\" id=\"BPMNEdge_flow14\">\n        <omgdi:waypoint x=\"875.0\" y=\"236.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"875.0\" y=\"281.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow15\" id=\"BPMNEdge_flow15\">\n        <omgdi:waypoint x=\"992.0\" y=\"148.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"992.0\" y=\"188.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow17\" id=\"BPMNEdge_flow17\">\n        <omgdi:waypoint x=\"972.0\" y=\"208.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"928.0\" y=\"208.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"100.0\" x=\"903.0\" y=\"187.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow18\" id=\"BPMNEdge_flow18\">\n        <omgdi:waypoint x=\"790.0\" y=\"139.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"790.0\" y=\"191.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow23\" id=\"BPMNEdge_flow23\">\n        <omgdi:waypoint x=\"992.0\" y=\"228.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"992.0\" y=\"281.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow19\" id=\"BPMNEdge_flow19\">\n        <omgdi:waypoint x=\"458.0\" y=\"268.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"358.0\" y=\"267.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"84.0\" x=\"331.0\" y=\"196.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow20\" id=\"BPMNEdge_flow20\">\n        <omgdi:waypoint x=\"325.0\" y=\"188.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"480.0\" y=\"181.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"84.0\" x=\"350.0\" y=\"189.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow21\" id=\"BPMNEdge_flow21\">\n        <omgdi:waypoint x=\"774.0\" y=\"342.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"773.0\" y=\"400.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow22\" id=\"BPMNEdge_flow22\">\n        <omgdi:waypoint x=\"826.0\" y=\"427.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"871.0\" y=\"427.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('4',1,'D:\\apache-tomcat-8.0.36\\webapps\\Spring-activiti\\WEB-INF\\classes\\process\\leave.leave.png','1','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\Ê\0\0\Ì\0\0\0\r©Q\0\0\0:IDATx\Ú\í\İœ\\e\'üEñ¯Œ0Ë°³®Ë²¼.¯Â‹.‹f]FAA‘±Ó©\\ 1\Ò@`0KC\Ì\Â K\Ò\İ	xAP@\Ì\Èu•®*H&CVa¸\Ê\0†Kb  µ\Ïÿt¦R\éNº“\î\ê\ê\î\ï÷óy>uº\êT7œ\Êù\×ó{sii\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0`»U*•~ø\ákÖ¬ù]±X¬\Ü|ó\ÍZ´\Ş\Ş\Ş\ÊÊ•+\ÚLÿJu\\\0\Z(:W«V­ª¬[·®òò\Ë/kM\ÔÖ¯__¹õ\Ö[ŸM­\Ïù—\n¨\ã\ê8µ4ƒZ@ƒD±Ö¹j\êN\ÖË©ˆ\ß\ï_* «\ã\Ô\Òj\r#š\nds·\ÔÁzÅ¿T@W\Ç1¨¥\Ô\Z$9Q›¾ƒUñ/P\Ç\Õqjiµ€&\ë`ıö7OV¾ı\â\Ê}½gf-–\ã9EUP\Ç5uƒZöU`\Ò\í\çŸY[¹÷G+ÿt\ÃI›´x.^SXmC\ïP\Ç\ÕquƒZš}hx\Ñ~ü¾\ë6\ë\\\å\íW÷]¯°*\Ú0VJ­R}T\Ç\ÕquÜ –A-Í¾\n4®h\ß_ş›A;XñšÂªh\Ã80µgR[R}<DW\Ç\ÕqƒZµ4û*Ğ°¢}\ïÍƒ\íxMaU´aŒBò!5ğõ“5,«\ã\ê¸A-ƒZš}•	¢³³óË—/ÿ\ê¢E‹\îX¸p\áú¹s\çnœ1cFeÚ´iY›3gÎ«_şò—Ÿ9ó\Ì3\ï:ÿüó¿ñ•¯|\å\ß\Ùj:XŠ60@H\Ş\Úó\ê¸:®Ô²¯jöUš\Û\âÅ‹?qú\é§ÿ\ãÌ™3Ÿr\åšk®©\Ü}÷\İÙ\×_}õ\ÕJnÃ†\r•x ò\Ãş°r\î¹\çVbıœO\ï™3eÊ”l\É\Æí¸\Ä`E;^SXmhƒ¶†ó\×\'\Õ\á\ê¸:nPKP\Öì«ŒS\í\í\ívê©§\Şõ…/|\á÷+V¬È‚ğplÜ¸±²zõ\ê\ÊW¾ò•\ßÏ;÷©£>úÓ¶j\ãŠöƒ«—\rZ´\ã5…UÑ††ä­…\àI\×	W\Ç\ÕqƒZµ4û*\ã\ĞÂ…\çu\ÔQ¯|÷»ß­¼ğ\Â•\íuû\í·WRP\Şx\Ì1\Ç\\\Ó\Ú\Úú[xô‹ö†µwW\îıñé›l¦\ç\â5…UÑ†Qv\à0;\Õ\Ã]_Wk\ÕqƒZµ4}.\Z\ç”SNùÆ±\Çû\êOú\Ó\ÊHz\î¹\ç*Ë—/\ß8{ö\ì\'RXş[zt‹v´G\î¸d³‚\Ï)ªŠ64($²\r\ï{~2„eu\\7¨ePK³¯2\ÎBò¼yó~\ç–\Ë/¿üw3g\Î|6…\å÷\Ú\â£\ØÁz\é¥ÊƒÿpÁ\æ#›\é¹xMaU´¡\ÉBòH½_\×\ÔqƒZµ\ì«0r\âp\ë˜IÍœ»ö\Úk_Jay­™\å\Ñ)\Úqsû_¬\îô0 x-\ÖQ\\ma[;Ç±Ñ¿G\×\ÔqƒZµì«°\í\â\Â]qNò]w\İUi”\ï}\ï{OLŸ>ı:W\ÄÁ¢Šñ“–*÷üğ¯\í\\\å-Ö‰upEF8$\ÔÓ„î„«\ã\ê¸A-ƒZš}•q\à”SN¹\'.\Ü\Õhó\ç\Ï¢­­mO`û‹ö\Ö\nµ®h\Ã(ª?gñR;²ú8õï›°\çBª\ã\ê¸A-ƒZš}•&÷I[@\ÄÕ­‡k\íÚµ¯NŸ>ı_\n…\Â\Î>‰\í+\ÚC)\Ô[*\à\n­¢\r#\ÔIû\í\Ô*\ÕÇ¡†\åÁ\Ş7!Ã²:®\Ô2¨¥\ÙWir§Ÿ~ú?^u\ÕU•±rö\Ùgß—‚òY>‰\í+\Ú\ÛÚ¹Ê›B«h\Ã„\ä–j\ç¹RÓ†–kCrŞ¨y}\ÂŞ©«\ãµjiöUšXgg\ç;fÎœùû\r6ŒYP^»v\íº”\í\\\å\í+Úš¢\r\r6Xx(ôn©>\Ğú°ş„:¼SW\Ç\rj\Ô\Ò\ì«4±.¸à¬…V\ÆÚ—¾ô¥Ÿ§°ü_}\":XŠ64Nª»7oc\í\İ\Ú9C\r\ËC\r\Éõıƒ\Æû6U\Ç\ÕqƒZú\\š}•&¶hÑ¢;®¿şú1\ÊK—.]\íğk,E\ZkÚ´i•hQ{\Ú\Ú\Ú>4Ä·\r5¬n­>Ü\\û÷\×7k\'|¨\ÛTW\Ç\rj\ésiú\\4±…®¿û\î»\Ç<(¯Y³\æ®Ô±(\ë´\ê`)\Ú\ĞøšS\Ón\ÚJ\Çq¸3Eƒu\Â_·!¹¾ó\Èxİ¦\ê¸:nPKŸK\Óç¢‰Í;w\ãºu\ë\Æ<(?õ\ÔSO¦bõ¤N«–¢\rcZsú;Ôm=œr NöÏ·#$o\ïOSlSu\\7¨¥Ï¥\és\Ñ\ÄfÌ˜Qyõ\ÕW+\Í Š”N«–¢\rc_sj;Õ™–\í\í\ì\Ô	ß<\Ü³¦Û¦\ê¸:nPKŸK\Ó\ç¢\É;I\ÍBP\ÖÁšHmŸ¥¦‹vø\á‡\ç\ä%\ÛY\â^7@§û\ç\Õ\ç·Ç’\íùÿ+Ì˜9&\ÛU\×ù6¨¥Ï¥	Ê˜QrPÖ†\ŞF²À\Ä\à7¿ù\ÍşŸ\ãvaƒ­û\ÔSOe\ëÿ\ä\'?\Ù\ìµ^xa³\ç}ô\Ñlıx\ßw\ÜQ¹ö\Úk+?øÁ*Ÿı\ìg³\åx\í\Ê+¯\ì_ÿ#ùH\åŸøD\åÁŒ{lg-–\ëÿûÿ\è\ê\ê\Ú\ê:\'xbÿr\\\Ì._\èÿI\Ñf’\Îİ:ˆ‡\ÔÜ¶okÚ\Î÷p\îßº\Å\Îw{Oiÿö®â¬\îòõ­½§|zû’•»\Öÿ‚\Î\Î\ï¿1½¾(–\ç/-\í×¨m\Ú,\ïø\æÎ;\äõ£~¿\ï}\ï\Ûä¹Ÿı\ìg\ã¢.OôOƒZµeA\Íròúõ\ëŸpr\ã;X«W¯®‹\Å\Ê9çœ“}\Şt\ÓMYh\İs\Ï=³PšÔlı_|1{|\Ã\ŞP\Ùw\ß}+=ôPj?õ©Oõ‡\Ş#8b“¿A÷­o}k\å\è.\Ö}×»\Ş5\à\Ó.»\ìRù\Ø\Ç>6`G\ê²\Ë.\Û\ä¹[o½5û]ñ7\ãq·\İv«\ì·\ß~\Ùr\È\ßó÷lö{.¼ğ\Âş\å\Ë/¿|³eE›I\\s\êr}(}¾et\çÜ–°¼\Ù\áœ’\ë\Ãğq\İ7¾­ó\âò›Ú»K\ËjŸ\Ï\ÂsWù´®ò‘\İÅ§×¿\Ï\Í]^~K#¶i3\åC=t\Ğ×£\ÖG\Ë\ëì®»îšµ¼\Î~ı\ë_\Ï~Ç¯~õ«¦¯\ËtFÙ \Ö$\Ô\Z\êş|\Şy\çmòÜŠ+*{\ì±G¶ü\ÄOlòZL`pÀ•¿ø‹¿\Èú€±¯\ßyç•\éÓ§g?\ï¾û\î‚2“\×i§ö\ëûî»¯Y®z½J§µ±¬\è\Ø\Ähıó\Ï?Ÿµ(°~\ã1:4\ë×¯\ßdD?f\r\â\ç\×yh®mo~ó›³\àœÿü\Ì3\Ïd\ë\ç;Šuİ™3gf\Ï\å\Ï\ßu\×]ı\ï‰0¼\ÓN;U,Xu´ò\ÎV¬?^«ıB¨\íD\í¸\ãY0\Ï@ê©§f\Ëñÿ•ÿ´=³üw\æ¿+®\0_\ZŠ6“°\æ\ÜV($ \Ú\Ù\İ\ÆN÷…-_ h8ğ/0ÁxÁò[wv´\î\ÒG,\ë}\ßü\îòÉ±Î±\Ëzß¹ «ôÉ¬SBr®»‹\íó—•‰\ç\æw•¾¿c´·i3\å¾[Z\'\Â\ïû\ßÿşÍ‚òò\åË³º_ÿûšµ.O° lPk’\rj\ru}&úmşğ‡³©Ø¯¢ÿ\Ï\Å\ëõ\ë\ßv\Ûm\Ù\ã#<Ò¿ÿ\æG\æ}7A™I)\î£|\ã76\Å}”SúšNk\ã;XQgÏ\ÖX\Îsb£€\æ\ë\ÆHd”ú]õA9ÖÎü\ã\ì\Ğ\ë\è\Ås £ã•¯sõ\ÕW÷¿\'f\Zö\ßÿ\Í~wóü\ï\Ç\ïŠ\ç}ö\Ùl\ä3\Ï_‹Y‰X\ì:õ3¼ã‹¤¥:£ñ³¢\Í$©9[\êl¹\Ó;Ì¼¥[\Î¥¾O\Ë ·œ\É\Ãp{wyF>;5¿§\ÜVÁ\ê\Şt\İ\Òñ›\Ìbe\ï\é= QÛ´:\ßQWc»¿ı\ío\ß\âz\ÑQşÀ>\Õ\Ö\Ì\Ñb96\ëgœš¹.O lPk’jm­E+\ïSE_*ß¿c@+\Ârı)ùş–O‚\äıÀ\Ú>YıÏ‚2“J\Úy\Î]¼xñ˜\åyó\æİ›\n\Õ\Ö\Æu°b´0±‰s\Ó\"Gp‡\ÑE\'%\ï\àÔ¯\Ëñ\\ß­\å˜)ˆó“óB{\É%—l2\ÚÑ™ª/\Â÷\Ş{oö\\„\å8(ş{â°½xŒV„úú\"¿;øÑ¡‹\å8Ç­~¦#_?ş_ó/”|  –÷\Ş{oE¶£ó;ŒÜ²a9Ÿ);l £ó\İ\Ù\Ùùºö®Ò©Y^\Úû®\Ê\çwK\ìB¾\Ş	ËŠ\ïN\Ï•wĞ³NzWiN\Çòò{µ›¡ó\Ï0Em\è(¡¼Å¡™q”O\ÔÖ¨“\Ñb9jø@§\ÍZ—\ÇyP6¨5‰µ†:ñø†n\ÈNŸ‹S\Ùb€)úS\Ñb?l©™Q\Î¡b\0+£Ÿû\ç\ã?—\í\á\Ğk&­“N:\éO<ò\È\ß\ÇE˜\Æğ\Ê\ë\n…\ÂoS\0z“O¤±¬ø\Üó0-:\'ùd\Û<,\ç\ë\'(G‹\Ãx\â°\ê­Œ‚]-d\Ù!ßƒ^Vü¿ğ…/d\ï«\ï”\å¡:/\èõW\Õx\àg>ó™şõV­Z•s\ë\äÛ¯¥æ¢–º‹Š)Ú°Íğ¡†\ä\á†\åü\ï\r’cö©/ü–÷N\í…Ñ‘À\ç2¶÷”«\íX§@}xGOiî¦\ïÒ·\Çc\ßŞõÁœ\Õ\ÇX,,G\Ç{ s”\ãü\ã¸Ñ±uy’\ÖqƒZ`_\İZ‹~V>\ÑûZ>Hõ\ï|g³Éü\ç8—¹¥z”_Kõ4»h_ü\â³ı­¸f Ì¤vò\É\'ÿó-·\Ü2fAyÙ²ew´µµ}\Ë\'\Ñø¢\Ç·ù\Èb^hk¯:šwZ†”\ë\ï«=\'¹¥\æpŸñŒ¢‡ö\åúš7o\Ş&\ç\'Gg.ş;ö\Úk¯\Í:dµªX?)­=œ0òÿş\Ú\ÅÔ¾7‚û–fUm°^?ctd\Ëğo)3P\'üˆatö[\â\Íhq‘ 8œ3‹p\0ŠÙ«\Î\Îrÿ¬Qt²cV\ê¸\î\Ş=\çw\çeòò“©ó\×\åÚ£}\âÂõw-ˆ™¥¨¿\å…V\Ú\Û\ÛûO³iöº<‰\ë¸A­	”c\"!\ï\Ç\Å>½hÑ¢lùø\ãï¿^~\r€X?ö«\Øÿjûb\Ñ‹ }±è“•\Ë\åMNw”™”N9\å”Â‰\'ø»±¸MT\ÚI_™>}ú¿Ì˜1\ãO}/\Úùˆc\×úÃ¢c$1/ºy0nP\é‹.º(;÷,By^Ì¢WÂ\â;\ĞmE\âo\Ç\ß\Ég)Z¶p{‘x­ö¡|\æb\çw\Î:p[;.¾\â\ê\ß-Õ™ó|°@Ñ†a…\å\Ús!k;\ÓÃ¹\ï\ê`\ïÒ¹–q\îb\\¨ö¹/¿j§\ì\â@=¥oô¯—:\äñ\Üü\î\Ò\â<4GH\ç:ºŠ—\Ö\ê‰\Üù\í³Fõ§½\äÁy(3\ÊQg\ãV\ã¥.Oò:nPk\å\Ú>]\í@S\Ür3úr\Ñ\âè½–.\æ•\ïû±\ßÅ©q(v~¯\Ëf”™ô\æÎûT\Õh‹-º{Ú´i=>±)\ÚqÑ•(„qşYŞ¡É¯z³¿\Ñq‰\Ò\Ö.\æ™<T\×ß3?\ÌúŒ3\Î\È~ğ›w~\â÷·rŸ\Ì|v#Ÿõsg†\Òñ\Ëg.\ê[\\Á;\ïpÅ—H>›’i´Ôœ3\ß\ÏSÑ†!«Ÿ±úƒj\çy¸WÇ­ßou“ğ‚ú\ç\â\ĞÎ\î\Òù¹œ£s\Ş÷|ñ\ì\Ú‡tnÏ…\ÆS\ç;\ê\\ò<\Ğ=’ãµ˜Q\Ê7kg \ã1f~óx\\‹\"¾+\ÆK]V\Ç\rjMä œ\ï3ù)o±\\Û‡«?ôº>(GŸ+¿}Tü\Z\î£Éœ9s>~ô\ÑGoŒ/\ÆFI_~\n…nmm}‹O`lƒr~\ãÚ™\å\Î\Ë/øP¾\Ú[G\Õ\ß\ë8Ÿ!\Ñ\Éx¬¿\êbü\Íú{j\Öş÷{\î¹ı¥¡|Aä‡Œ\Ôâµ–š\Å\Ôv\Şâµ¸xXb˜\ßTÑ†\í\n\Ë#Ñ©_?‚¿oB\Öñ\á·g\Ê\ï:0Ø­ òA\ÓúSuòÁ\Í\ÓO?}X÷f©\Ë\ê¸A­\É”[ª‡K\×÷\åòA©n\'\ÕR3?Ÿ|òÉƒö÷e&¥c9\æ\ï–.]úJ#ÁN;\Şq\ÈõÔ©S´\å\'v\Ñnô9wŠ6Lˆ°<Ò¡[W—\ÕqƒZ~_É‡˜d¨Ÿô\È\Ãpı©µA9³‹\í\åG\æ3Íµ÷A·¯2i\Å\åñ?ÿù\Ï?r\É%—lÍ¼nİºWgÏıD¡Ph·\Õu°&jS´™Ä†<³4J\ïW\Ç5uÜ –}uˆw?±¯\Â¥ğºó¬Y³6\\u\ÕU/\ÖLr5$Ÿek+\Ú:X0\á\Ãòp;\ÏC:\ÇQ\×\ÔqƒZöUMŸ‹†‹+PÏœ9s\íE]ô\ÔHŸ“‡[›IV´m˜†;\Ó4\ág¦\ÔquÜ –}U³¯2\Î\Å\Ìr\nµ\×\ÅÕ°}ôÑ—¶÷Pqu\ë¸p—s’mE„\å\ì“\Úó-ƒ\ÜwU\×\ÔqƒZöUÍ¾JSikk›—ó\Ó_ı\êW\ïyè¡‡†5\Ãü\ÔSO­[¾|ù\í1‹<mÚ´\\\İZ\ÑV´aR:¨\Z‚\Ú\Â\ë\ë\'SHV\Ç\ÕqƒZöUÍ¾\Ê7\İ\Î\ÔŸ3g\Î\Ï\Ï9\çœ\Û\Ê\åò=öØ£µÁxÃ†\rO¯Y³æ®¥K—®7oŞ½…B\á·)h+\å¶mE&µÁ:\á“jfJW\Ç\rj\ÙW5û*T\n¾ª†\æ›R{$µWR«TÛ“©İ–\Ú\×R›2{ö\ì7\ÙbŠ¶¢\rŠ\'mHV\Ç\ÕqƒZöUÍ¾\n(ÚŠ6P\ß\Ù^2™C²:®Ô²¯jöU@\ÑV´Z\ÅQH-\Õ\Ã;;;;_·-¿¤³óûoT\Ç5uÜ –}U\Ó\çmE&„jPÎ´w\Û;–ôşy\Çy\Å\İ\æ/\í}W\àh\İ\åM\î’0Yù®r®\ç./¿¥½»´L\×\Ôñ\Æ\rj\ésiöU@\Ñ\ÖmhTP\î)}\ã¸î•»¤\à{x\ác—õ¾3oùló—\Î_µ\ÓüòQ¤#T\Ï\ï.Ÿ\ë\Ï\ï.?¿»8O\×\Ôñ‘\×\Ú\Úúú´¯¾ª\Ïe_µ¯Š¶¦hCƒ‚ò	=\å=\"·w¿³\Åó»J\ç\Õ†İ¾d\å®ñ\Ø\ÙY\Ş!Bq,wt—\ÎH¹-\æ}c\İx¾ó\âò›\ÔqMy|ği_}IŸË¾j_mMÑ†\åş@\Ü]:¿}Iy\ï‚Ï‰Ã­£µ÷”vt•\æ\Ä\ë1cœ\Í§ \Öùhr\İ\Ñ]üxÿú]\ÅK\ÕqMy³f\Ízs\ÚW«\Ïe_µ¯\ãF±XT›»½˜Šö+ş¥\Â\àA9¡@\Ü\ŞU>-K¡wQx\î*\Î\Êg”û^\ë=`Áò[wÏ‚s\n\Ì}\ë”O;®ûÆ·Åºê¸¦¼\Ö\ÖÖ·§}õ7‚² ,(\ã\ÆÊ•+Ÿ\\·n\âØ¤m\íÚµ›Šöış¥\Â\àA9f‰\ã\Ğ\é–÷Ã¨cf¸F¹»|]H\î)\áxAW\é“q®r®Sˆ\Ù\åü0lu\\S\ÇG%(ÿQ\ÚW7˜œ0¨eP7J¥\Ògn¹\å–\ß<ıô\Óÿª@6W±\ÎUooï£©}Î¿T<(\Çc„\Ş\É\Çw•>\Ø\ŞS>¬?//¿·ù¼\ânñ³\ÇqÑ¯\î\âÙµ¿kÁ²\Ş÷©\ãš:>òfÍšõ\Çi_}\Ú\ä„A-ƒZÀ¸’¾ÀI…\áöE‹CN\Æk»\âŠ+*\Ñi\Ïÿ5->‹û…dZPóŒ\ã1f†\ã\â^ù\ëq\Å\ë\ìù¸\ÊuOñóó{Š­\Çu÷\îyÂ²\â»c\İ|½\ìõº\ÛH©\ãš:>bû\é¿Im­\É	ƒZµ\0\Æ\æ‹øú\è4O™2e[&‡Baz%f†;zJs³Àœ\ÂpN\İ\ßzÊ‡\ÅÕ¬\ãP\ë\Ú\Ù\å¾C®‹gg·ŠJ-\ÎSNaùı¶(Œ\Ê÷ó\î©=fKL¼A­	2AaP˜¸\Ú\Ú\Ú>”Šõ+Q°…\ÂA¶Lš¸¯@“kmm}O\ÚW¶%\Ô`\0\Z”¯b]m·\Û\" “4‡\éÓ§ÿû´¯şÂ–Pƒhl‘\Ş\'ŸM\Î[\nÎ‡\Ø2 “Œ½ôüÓ¾ú3[B\r ±EúúÚœ\Ï*;WtÒ€¦\Ê{¥}õ[B\r qz³\Ù\ä¼\n…\Ãl!\ĞI\Æ\Öô\é\Ó÷Naùm	5€\Æ\è›\n\É\Õv›-:iÀ˜\ï§û¸~ˆ\Z@c¿x_\ÙBPv®2\è¤c¿Ÿ\î—\Ú\Z[B\r 1\Åùú-…dWÀ4`\ìM:uÿ´¯ş½-¡ `öy )\nMû\ê-¶„\Z€‚\r\Øç¾ıô¿§\ÖkK¨Á\0(Ø€}h\Énõñ´¯şÈ–PƒP°û<Ğ’\İ\ê“),\ß`K¨Á\0(Ø€}\è\ÛO?Úµ¶„\Z€‚\r\Øç¾ıô³©]eK¨Á\0(Ø€}h\É\ÎQn-\nß·%\Ô`\0lÀ>´d·‡*¤}õr[B\r@Á\ìó@\ß~:+µKm	5\0°\Ï}û\é\ì\Ô.¶%\Ô`\0lÀ>´d‡^¡­­\í[¶„\Z€‚\r\Øç¾ıô˜\Ô.°%\Ô`\0lÀ>ô\í§Ç¦¶Ì–PƒP°û<Ğ’\İj~¡PXjK¨Á\0(Ø€}h\É\ÎQ>!…\åsm	5\0ùıûú\ØÇ·\Òn·¥ \é‚ò—SPş[B¿\0ùı{Ÿ\Ô^\ÙRPNñCl)hº}÷¯S[lK\èw `£³ß´… |Û”)Sv°• ¹´µµıB¡p†-¡\ß€‚\rŒ\Î>¾\Ï`A9u\Ä³… )÷\Û3S[hK\èw `£·Ÿt®ò\íf“¡i÷\Ù\Åqøµ-¡\ß€‚\rŒ\Ş~¾Ù¹\Ê\ÎM†\æòŠz\Ùú]\0(\ØÀ\èv¼¯6›\ãC\n\Éÿ+\í³l	ı.\0l`tƒò‡j\ÎM>\È¦\ÊK\Ó>;ß–\Ğ\ï@ÁF\Ï\ÎU6›M¿¯.K\íX[B¿\0ıı}û<4¿¶¶¶¯\n…/\Úú]\0(\ØĞ”*•\Ê?üğŠ5k\Öü®X,Vn¾ùf­	Zoooe\åÊ•¿Nm¦¥LÀ\ï\æS;Ê–\Ğ\ï@Á†¦!yÕªU•u\ë\ÖU^~ùe­‰\Úúõ\ë+·\Şz\ë³)4Î¿T&\ØwóÅ©Í¶%ô»\0P°¡)\ÅL²\Ü\Ôaù\å›o¾ù~ÿR™`\ßÍ—\nGK\èw `CsŠÃ­\Ò\æn)(¿\â_*I\n\ÉW´µµM³%ô»\0P°¡)\Åù°\Âh\ÓeuŒ‰”¿Ÿ‚r«-¡\ß€‚\r\ã:(ÿö7OV¾ı\â\Ê}½gf-–\ã9AVP†møn¾*µ\Ï\Úú]\0(\Ø0nƒòóÏ¬­\Üû£…•º\á¤MZ<¯	³‚2G[[\Ûu…B\áP[B¿\0\ÆmP~ü¾\ë6\Éyû\Õ}\×³‚2÷»ù\Æ–¶%ô»\0P°a\Ü\åû\Ë3hP×„YA†ù\İü£”?nK\èw `Ã¸\r\Ê÷\Ş\Ü9hP×„YA¹Q:;;_·m\ïûşm½¦ún.\n…\Ùú]\0(\Ø (k‚òvj\ï.¶w,\éıóóŠ»\Í_\Úû®À\Ñ:º\ËÖ®7Yù®òA±<wyù-\íİ¥e¶^óH!ùÖ©S§~Ä–\Ğ\ï@Á†q”\ã*×ƒ\åxM˜””{J\ß8®{\å.)øAø\Øe½\ï\Ì[>\Ûü¥óW\í4¿§|T\é\Õó»\Ë\'\Çúó»K\Ç\Ï\ï.Î³›\â»ù\ïSP\Şß–\Ğ\ï@Á†q”\\½lĞ ¯	³‚òh;¡§¼G\ãö\î\â·b¶x~W\é¼\ÚÃ°Û—¬\Ü5;;\Ë;D(\å\î\Ò)0·¥À¼o¬\Ïw^\\~“½¾)¾›×¤¶Ÿ-¡\ß€‚\r\ã6(oX{w\å\ŞŸ¾ùa\×\é¹xM˜”%…\İóÛ—”÷N!øœ8\Ü:Z{OiaGWiN¼3\Æ\Ù\Ìq\n\Òi\Æ!\×\İÅ÷¯\ßU¼\ÔVlŠ\ï\æ;¦OŸşA[B¿\0\ÆmPö\È—l”\ã9AVPn„8„:q{Wù´\ì\ç\îò¢şğ\ÜUœ•\Ï(÷½\Ö{À‚\å·\î\ç˜û\Ö)Ÿv\\÷o‹u\íõMñ\İ|W[[\Û¶%ô»\0P°aü\å—^ª<øl~\Øuz.^f\å\Ñ³\Äq\èt\n\Ëû\Ça\Ô13\Ü?£\Ü]¾®?$÷‰p¼ «ô\É8W9\×)D\Ç\ìr~¶½¾)¾›\ïIAy/[B¿\0\ÆeP~ş™µ•_¬\îô\åx-\Öh\å\Ñ¡7Bòñ]¥¶÷”\ë\Ç\Ë\Ë\ï\í_>¯¸[<\Æ\ìq\\ô«£»xv\í\ïX°¬÷}¶dS|7\ß_(ö°%ô»\0P°a|\å—^ª<ù`©r\ÏÿzĞœ·X\'\Ö5»,(¦8\Ï8cf8.\î•?W¼Î«\\÷??¿§\Øz\\w\ï\',+¾;\Ö\Í\×\Ë^¯»cö\İü`kk\ë{m	ı.\0l7Ayk³\Èf—\åF\ê»Orñì\Ò\Ü,0§0‡S÷·òaq5\ë8Ôºvv¹\ï\ë\â\ÙÙ­¢R‹ó”SX~¿½¾)¾›NAù=¶„~\0\n6Œ› <”Y\ä-\Í.·‚2l\å»ù±\Ôv·%ô»\0P°a\Ü\åm\r\Éyne\Ø\Êwó3g\Î\ÜÕ–\Ğ\ï@Á†q”5AFù»yİ¬Y³şØ–\Ğ\ï@ÁAY• œ\ê\Ü>mmmWû\×\Ì8ún\Ş\Ğ\Ú\ÚúG¶„~\0\n6\ÊÚˆ\åÈ©]Ÿ\Ú+j\ã\ì»ù\Ù3f¼Í–\Ğ\ï@ÁAY‘ \\ó\æ_3\ã\è»ù…C=ôm	ı.\0l”µ\í\n\ÊmmmŠC¬\ë² \Ì8ün~\é\àƒ\ŞÑ–\Ğ\ï@ÁAYÛ¦v\ÅWTšA”\Ç\ßÍ¯¶¶¶¾Ş–\Ğ\ï@ÁAYÛ¦¶¥p¬iãµ©¾ú]\0(\Ø (×µ\r6Ä¾Yy\æ™g*/¾øb\å\Î;\ïÌ«m\åry³÷\Å{\Î9\çœ\ÊSO=\Õÿó\âÅ‹·ú÷®¾ú\êÊ®»\î:\è\ë?û\Ù\Ï*w\İu×€\ï²\Ë.kŠC¯§Nz`ªi·	€~\0\n6LÀ \íõ¯}\å€È‚r\Ò\Ëñx\î¹\çö\é|İ·¾õ­Y˜\çn½õ\Ö\Êõ\×__¹÷\Ş{³Ÿò“ŸTnº\é¦lyıúõı\ïyğÁû—¯½ö\ÚÊ»\ßı\îşŸW­Z5`(\ßu\Ã\r7T8\âˆ\ì=ñ\ÜE]TùÁ~-\ç},/\æU(Jµm• \èw `\Ã\ÊÑ}ö\Ùşz\É%—dû\ï¿û×‹`\Ü\ÕÕ•=÷\ï|\'{œ>}z\åò\Ë/\ïÿ•W^¹YğıÀ>Ş…Vv\Úi§\Êi§\Ö€\ëgŠó`Á}¯½ö\Ú$(·Œ\á\Ìò`·‡ª\Î0¯”ı.\0l\çA9f}W¯^…Ï˜©\ÍCm>c3\Å<ğÀ&A9»µ:fcf8ÿùù\çŸ\ß,(\ç\á¹~F¹öµø»y(\åø=y\Ëÿ^¾|\Çw4MP\ÎUg˜oó¯\Ğ\ï@Á†q\Z”k\Ãjœ;œ/÷ôôTşò/ÿ2;\ìù\Ç?şñ&Aù\ÑG­\\x\á…\Ùsû\î»oÿûb8ûÔ§>5\à\ï\ßÒŒr~t\Ì \ç\ë\Çy\Êq\èu„\èb±\Ø\ßbV9üñ¦\Ê\0ú]\0(\Ø0Aƒr´<\Ä\Ö\Ï(\ï¼ó\ÎÙ¹\ÉñÜ¯~õ«\ìü\æØ¿\ã\Ü\äx}\îÜ¹\Ùkf‡;£\\ûÜŠ+ú—÷\Ûo¿M\ÎU\Îÿ[e\0ı.\0\åQ\Êq˜õ#<\Òşq~¯üB]±\ŞO<‘=F\ähq\ÈöG>ò‘l9‡\àü\Â/lÓŒr\íúw\ß}wå¡‡Ê–>ø\àM‚ò@\0”ô»\0l”G4(¿\á\ro\È.Î•\Ï\Ç,o<Æ¡\Ö-53Êµ\ï©=§8<\ï¼ó6[7~\ç`W½Y\é~÷;\î\ØÖ§L™\"(\èw(\Ø (76(Ç¬nKõ¶Nù}Œó‹r\r”cÖ·>ø\Ö\Î<\ÔZ \ßW\ÒÎ—ó\Õ–-(\èw(\Ø (Z‹s‘\ã0\ë\Ú\ç\âP\ê–\êE»joaw—]v\É\ã\Â^q\æyó\æe?ó›\ß\ÌŞ“\ßnª¾E\è\İs\Ï=·ø\ßò\Ì3\Ïl6s\ï:\ãŒ3²Ÿ\ãlA@¿@ÁAY\ã&(ú]\0(\Ø (k‚2 \ß€‚\r‚²&(ú]\0(\Ø (k‚2 \ß€‚\r‚²&(ú]\0(\Ø (k‚2 \ß€‚\r‚²&(ú]\0(\Ø (k‚2 \ß€‚\r‚²&(ú]ú]\0\n6Êš  \ß `ƒ ¬	\Ê\0ú]\0\n6Êš  \ß `ƒ ¬	\Ê\0ú]\0\n6Êš  \ß `\Ã\äU,…\Ñ\æn/¦ üŠ©€~\0\n64\ÈÊ•+Ÿ\\·n@Ú¤m\íÚµ›‚òış¥ú]\0(\Ø\Ğ ¥R\é3·\Ür\Ëo~ú\éL›k&9Brooï£©}Î¿T@¿\0\Z(±Cn¾ù\æ\Û\ã\ß8v<·\Ø\ç\ÇûÿCµ\Ågq¿\èw `öy\05\0°\Ï¨Á\0(Ø€}@\r@Á\ìó\0j0\0\n6`ŸPƒP°û<€\Z€‚\r\Ø\ç\Ô`\0lÀ>€\Z `öy\0\Ô`\0°\Ï (Ø€}\05@Á\ìó\0¨Á\0\n6`Ÿ@\rP°û<\0j0€‚\r\Ø\çPƒlÀ>€\Z `+\Ø`Ÿ@\r@Áû<\0j0\0\n6`ŸPƒP°û<€\Z€‚\r\Ø\ç\Ô`\0lÀ>  `öy\05\0°\Ï¨Á\0(Ø€}@\r@Á\ìó\0j0\0\n6`ŸPƒP°û<€\Z€‚\r\Ø\ç\Ô`\0lÀ>  `öy\05X\rP°û<\0j0€‚\r\Ø\çPƒlÀ>€\Z `Í¾_ûøV\Ú\í¶€~\0\n6L–ı{Ÿ\Ô^\ÙRPnkk;Ä–\Ğ\ï@Á†É´ß´… |Û”)Sv°•\0ô»\0P°a2\í\ãû”…\Âa¶À¨\Õ_§¿\0\ÊÀ8\ë¬\İn6`Tk¯\Ó_\0e`<u\Öt\Î\0\ZRş (\Í*\ã«\Í&4¼Ÿ\åô\0Ah\â ü¡š\Î\ÙA¶@\ÃúZN”f\ï¬\éœ4´ö:ı@Pš¹³vø\á‡\Û\ç\Z\Ì\é/\0‚2Ğ¼\â\ëJõ€\Æe§¿\0\Ê@:0µgR[R}t\Ø@cû\\N”&\Éy8ÙŒõ\Â2À\È+\n;·µµ¥.Ö´¯¥VN\íñºy=·†J\ë|+­û…´üg¶\Z€ ŒmH\Ş\Úó\0lƒ©S§X=ù\Å-\Ü;y úº-µ\Ùf›e`ô´•0œ¿\î|9€m\ïK\ÅU­of8¬\İ³Ì¶*€ ŒnH\ŞZ6³°R¨=«ş\ÖO3fÌ¨œu\ÖY•+VT\î»\ï¾Ê“O>Yyñ\Å+a\ãÆ•u\ë\ÖU~ñ‹_T®º\êªl½Y³f\r˜oJ¿\çOma\0A9¶o¦x¸\ëLj­­­o©\ÜngÏ]¹\ì²Ë² </¼ğB\åšk®©´··W\ê\îµüLzœbk\ÊÀÈ…\äC¶\á}\Ï\Ë\0C\nÉ«jC\íÂ…³™\ã\íñê«¯Vn¼ñ\ÆlFº\æw?Ÿ\Ú\çlu\0Ah|H©÷L†¾\Ó&3\Éqˆu„Ü‘²v\í\Ú\ÊI\'T–_lkkS—e`l\í\Â]ş=\0Nõœ\äş»fÍš\Êhˆsš\ãü\åÚ™\åô·÷ğ	\0\ÊÀğ\Ã\íH6mf`ó>\Ó>µîŠ™\ä\ÑşZ¼xñ&÷_{4û$\0e`\è¡6\ÉÚ‘\Õ\Ç\á¨Ÿ|\Ôhkkû\Ç\Ús’Gòp\ëÁ<÷\Üs•£>ºö_K|\0‚20´|HM\Øıvj•\ê\ãP\Ãò`\ï–’©S§X{u\ë\í½p\×püô§?­¿¸×ŸùD\0e`h!9Y\r»•a„\åÚœ·#j^w\Î2 ¿4m\ÚõyX[@5Ú¹\ç[–¿\æ”\Í\r^\n½[\n\Ë­\á\0\ë;g˜´\â¼\à¸òtô™\â\ÖMÃ½OòHxè¡‡6¹¿ò\ìÙ³\ß\á“”\ÍCòA\Ã¿…å¡†\äú°\ì0l`\"…\à›Sû¯[Z\'\ÓiyH+Q•öööş°œş›ó\é\ÊÀğ\Â\ê\Ö\ÂòpCr\í\ß_\ßbf˜@ı jğ¼9\â\r²\Î\×\Zu¥\ë-¹ò\Ê+]\Ô@P	\ÉC\r©ƒ…\å\×mcH\Î9g˜pA¹¦\İT?Ãœ+\ç¯?ğÀc”\ãÍµÁŞ§ (ƒ¼m\át °üó\í\É\Ûû\ß\Ğ\ìA¹?ˆ\æ9ıüxş|#¯v]\ï±\Ç\Û\ä\Ê>=€\Æ|Aü>µWS{%µ©½œ\ÚKÕ‹Wükj/¤ö\Û\êm	M\í7q1‰ôø/©mH\í×©­Om]jO§öTjO¤¶6µ_U¿dK\í\Ñ\Ô~™\Ú#©=œ\ÚC©=˜\Ú/RûyúRz =ŞŸ\Ú\Ï\Òò}\éñ\Ş\Ô\îI\ë\îôøO\Õ{Ş™\ÚOS»#µ\ÛSûIjÿ\'µ5©İ–\Ú?¤ö÷©­Jmeú=·¦\Ç[bD8-—\Òc1µ\ŞøL?J¿ó‡1‚œÚiù†ôø¿\ã\ê–iùºôxmj×¤vUj?H\Ïı]z\\‘\Şûıôxej›–¯H—§ö½\Ô.M\í’ô\Üw\Ó\ãwR»8-_”¿Ú…\éı\ßJ\ßL_O¤v~Z^—¥Ö“–»\ÓcWz\Ï\Ò8¬*=ş¯ôxnö•–\ÏI\Ë“–\ÏN\Ëg¥\Çÿ™\Ú\â´ü\Õô¸(=‘;S;=­÷?\Ò\ã\ÂÔ¾’–OK^?5-Ÿ’¿œOJÏ˜–OH\Ë\ÒrGZnO\Ëó\Óòñiù¸ôxlzœ›ûRZ>&-1=\ÎI\í\è´ü…ôxTj•\Ú\ìôó‘i½#\Òò¬´<3-\ÏH\Ë\Ó\Ór¡znWzhkMŸKOıeZ><-6Î±JËŸIËŸNË‡¦\åC¦OŸş\Éôxpúù ´ü‰´üñ´ü\Õ[sü÷´ü±´ü\ß\Ò\ãG\Ó\ãG\ÒsDg&-ïŸ–ÿKZşp>—–÷K\ïÿÿ\Ó\ã>\éñƒ\é¹¤\åÿ/-ï–ÿsZ\ïı3f\Ìø\Óò^iù?µ¶¶\î™÷Hÿ!=÷¾´Ş¿O\Ë\ïM\Ëÿ.-ÿyZ~OÜ’#-¿;=\î\Şû§\é¹\İ\Òò¿™9s\æ®iùO\Òû\ß5kÖ¬?NË»\Ä\Å_\Ò\ã¥õwŠ‹®¤å·§÷¼\íÓŸşô[\Óò[\Òzo>ô\ĞCÿ0-ÿ?|ğ\éñs\æ\ÌyÃ”)SvHË¯\ï\ì\ì|]5Àn\ï\î@ay{Br}Xv\Î20\á‚r\ís\í\Ï/¾ø\â˜\å7nò\ß\æ\ÓhŒ?ˆ\ÎytÒ£³öè¼§ş›¢#ú\è\ØG?:û\Ñ\é\Î„€Gq\Ä;«Á`—\n\"<Dˆˆ0¡\"\ÂEZş·Õ ñg<ª\ä½J\"œDH‰°’–ÿc5¸ü§2h\"\ØDÈ‰°¡\'\ÂO„ ´¼o5\í)‚R„¦O¢\"LE¨J\ËSª\ëc¸\"xE‹0¡,\ÂY„´ôÚ§\"°Ep‹\0W\rrŸp!/\Â^„¾´<µ\Z\0§E ¬Ã™#4FxŒ™–?_\r”GU\æ\Ñ\Õ\ĞyL„\Ğ£J\Óò¼j@=>k5¸.ˆ0¡6\Âm„Ü´|r5ğ\Z¸\Z„¿R\rÇ§GX®†\æ3«:‚ô\â\Ö°#lG\èğ!<\ÂxZ>¯\ZÌ—FP¯öe\Õ~„új¸ÿF5\èGà¿°:\0pq\nT.‰Á‚´|Yu\à\àò\ê@\Â\ßVVT~ƒiù\ê\ê@ÄµÕ‰ë«ƒ7F\ç¤:ˆñ£\Ô~\\\Øè\ê€\Ç-\ÕA•\ÕA‘Y](¹­:pòªƒ)wTW\î¬¶\ÜUx‰˜{b@¦:0su°\æ\ç\ÕÁ›\Äù\ç\ê€\Î\Ã\Õ_V}¯­­\n=Y zº:`´¾:ˆô/\ÕA¥\ß\Ä Súı\ÏUœ~[€ú\×\ê \Ô\Ë\ÕAªWªƒV¿«`Egh{\ÏE‹\Ğ]?“üó\êó\Ûc\É:™š¦i¦5A\0 \ÏÖ®r½\ÕA°–Ág”‡rŸ\åÁ˜QÆ½-„\â\Ûc\Ğ<&\Ì(\04§¥Ï·Œ\Î9\Ê\Û–£LÔ \Ük\Öq2\0@‡\å\á\Ì\àv¨®z=œ°\ìª\×ÀDÊ·\Åu3jr\Í:®z\r\00\Âò\ÖB\ê\Öî“¼µû,fŸ÷Q&VP\Şly€uzš\á>\Êñ·k‚}O\0\à5[›\Ñ\İZHn\ÙÆ°œş}˜\0˜Lª\ê\Ì\êYg5fAù¤“Nª\rÊŸó\É\0\0lZ\n\ËC\r\É\Ã\r\Ëù\ß’I§zç¸]f%-W{î¹±>?ùÅ¸ÓˆO\0`s1³\\ô‘-Ã¿Oò@aùˆº¿\ãœ\ä&\Ğ\Ùùı7nm/¿j§¡ı®ò¶(]\íy\ÊW]uUÃƒò\\P”/ö‰\0\ĞÀNh\ç\ëF\â÷\Ìù\Æõ8’_\ØJX®½ÀWm\èJHn\Ù\Êû\Üj\Í\ï.ß±¤÷\Ïû\î)·µ/)ï½¥\Z\Ö\ÑU¼4ÿù¸\î\ß6wyù-}\Ë+w\é\è.}4­}\É\Ê]Û»Ê§\År\í\ß8aYñ\İ]\å#Û»Š\'\Î_Ú»oGOin¶n´\îòŒ\Ëo\İ\İ\'\ÃdT{øõÜ¹sz›¨µk\×f3\ÙùßŸ>}ú\Ş>\0FEû²\Şwt—œ¿¬|HtşúZ\éü¼SYd£3™Ï¾Dgqş\Ò\Ò~ó»‹\ç\ßU\ŞkÀ\ÎmOùª¯v@ª\ë/ß:¤\ï\Z© Î¤Sv„\Ü#Z†Ë§ú÷m\ïı›\ÙQ‹:zŠ\ÇôÕ¡òQ‹ú\êEªI=¥ıc\æ8jFª\ïÏƒì‚®\Ò\'\ã=ù\ÏŒO\è)\ï\Ñ_÷ºŠKó:”\êİ²ôó¬¨ƒ\í=\åÃ]\Öû\Îüo¥÷“×¿ü¿!«W]¥ó|2LV\Õû)ß“‡\Õk®¹¦aAù\Ì3\Ï\ì\ÉmmmWû4\0İ½\ä-›¡\é)Ÿÿ³(5·­£»øñ¬\ã\Ù]úv\ã\ÔAıFı,p\Çòò{Û»‹…\èp\Æú±Nÿr\êˆnú·Ë‹bF&:ªYµ»|]\Ø{\ÊGuœW\ÜÍ§\Ã…\å\í5\Ğa\İ4PÔŸ<œF\Ù\á¨U £\åƒwQ7újUÔœ\ÒQÃ²š\Ò]>¹ó\âò›b\Ëª£E\ËfŠS½\ëû;\Å\Öş¿™şN_]*ŸÕ¤\Ô=¥…}¿;=\ßU:\Õ\'\ÃdV;«3¼¿ü\å/G=$\ßxãµ‡\\¿’‚ò^>	\0FEt,\ë}_6C“:˜\Ñ9Ì–«ùzy\Çt~O\é\Ó1³¾µ\Ê\\\Ì\Æ\ä‡4ÆŒN´¬›:™ùröwk\Î	Œ¿-f«\ã\ïF\Ç\Õ\'C“„\å‘\İ;$[#\è\Æ\Ìn\ÄEÍŠp¡¹¯•ö{m\İÒ§ó:¯\çG¦\Ä\ìs¾N6‹\Ü]<;\Ğ\é½1³u+\êN{w±=f¨ûj\Ô÷\ß‡a§\ßó½¬¶-\ëıp\íQ6ñ~Ÿ“]\n«\×\çÁuÁ‚•^xa\ÔBò\êÕ«79\ä:µc|\0Œª®\Ò\ße³\È]\ÅKûf“³Ù’ı\áwIy\ï\êŒğ‰1+<¿»8/:”1\Ë\ØhùEsb9f‰û\Îù+z\\w\ï\Õ\åù\áŒÙ¬súùø®\Ò\ãpï¾¿Wœ\Õ\ÑSü|\ßrù´\æ>¶\Óö.\íp\ëf©Q©.\Å`Z¶œ\Âk>“œ\Í&WgŠ«øøü\è—ü•¾Y\á\â·6ù}\éwDğ³\Ğy@®=o9«}©\Å,r>ˆ—×²\ìP\îºSG`2jmmı“X\×\ç\áuñ\âÅ•7JH={¶x\Ğ8\Ù\ìJõ5q(tv\Şq\n¯µ³¿¯u\ZK§\ÆM\çş\åšÃ³û:´}\çóe\ëw—–\r´\\ıùüxŒ€Á;\ï\Ğ\ÆùÎ®@\Ë(„\å\á\Î»pW“\è;w¸xvÓ¸W„\Öş\0\ÜSúFÔ¬şú\ÓS<&«Kñ|w\é»QÇ¢\Ô_ô+ôú\êUñ\ì¾ócğ¯<£v\Æ8ù\âğ\í\ìÔ\ê¾ªG\Şy®£\0}\Ú\Ú\Ú>”\Ú3yˆsˆ7l\Ø0¢‡[\×\Í$ß”ú[ly\0F·\Ú]:<ªqˆa_X--i¾NvXtv¯\â\Å\ÑñŒ™—8;\ëp\Ö]\Ğ&‚\îk\Ï\é\ŞYø®9ô±¶£ú\Úa•}\ß\è˜úTa\Ã=|\Ú\á\ÖMäµš]¬\ë]nû\ëWOia\íº}\ß*/\ÊfŒc8µ½{¾özvñ¯î¸B\ß@_\éÔ¨gQ×¢võ\äÁ\é÷D@\î)~>Ş“]d0.v3\Ì\é=Ù‘0®£\0ı\n…\Âaù½•£\Å\ì\ïš5k¶û\êÖ§Ÿ~zm@’hŒ\ì)\Õi\å‡\'\æ‡A/\è\êıoı\Õ\î\ÒGó}e‡\\÷\×7+nıT{\Ø,T×¼/:¤ùrf½Iç·«xivNt\ê\ÈÆ¬ök\áúµN0ŒAX\Ş\'µ\çS;\Ì&{ùm›úf•{\È\ÎI\î.-~m`\íµz‘]°§47f…ûôÊ‡\åµ&\Ö\Ëo\å8d\é\è*Í‰\à¿;«…\Ùlty‡<\ÌO%©?&\êUœ«\çIû„\à5S§N=0\Ù\çkƒ\íYgUy\à†{\ì±\ì>\Éu³\È\Ù\á\ÖB2\0\r“>˜Ïª\ä\Ï\ç·Q\É\î)}º\ï\ÖP¥Sû:ª\Åy}¡øµ‹u\Õ\Ë\Âow±0\Ğk\Ù9\Ìİ¥ÿıİ®\â\Òşğ\\½b­O…QrP5´…\×\×\É\ÍTŸ\Ê;\Ô\Î\Ü\Æ@\\œ+\Ü¤«5&\êMí­Ÿ\â\ŞÇ›\Ü\nªz®üµ¸\Úuÿ5\Ò\Ï\Ùc~­„š¿—\ß^*?%Bt6ûœjb\\kÁ\'›*\n{¤@ûx]À­w\Üq•+®¸¢²jÕª\ì\ê\Øùy\ÌñÁ8fŸW¬XQ9ù\ä“\ë\Ãqvuk\î a²\ÙÛ¸ˆM~ht\ê|F\Ç2ÿ9fc\â1:“¦³sõR\Ç0¿J_\'µ<c°‹nEGrKW¯\Ù\èjGôóñ×¸¨X\í!\ß0\n›Yv¸5ÀˆY\ß˜ÏªŸ]Ş–÷Iv(\0€±	\ËB2À›1cÆŸ¦°»¨öB_Clq®ó\ÅÓ§O\ß\ÛV\0›°¼DH=³g\Ï~Sõü\å¯\ÅÅ¸84û\ÉB¡psz\ìI¡zZZ\Ş\ÙV\0;qNr¥\Å- \0\0\0 \ß;l\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0&‚ÿ–\è\íK3Á÷e\0\0\0\0IEND®B`‚',1),('5',1,'D:\\apache-tomcat-8.0.36\\webapps\\Spring-activiti\\WEB-INF\\classes\\process\\purchase.purchase.png','1','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\06\0\0\Ñ\0\0\0‘ª9\Ñ\0\0€\0IDATx\Ú\ì½	œTÕ™‡[–1\ã7q\Ç8&ù\ÇqœŒ\Zu\Ç\Ï$:j4\Z\è44›\"‚4(\"\"•\İ\r¸\"*ˆŠtU-‹€\ìÈ¾om³	ˆ€€\ç»ÿ\Ó}\Ê[\ÕU½/µ<\Ï\ïw~u\ë\ŞsoU×­¾}\Ï\Ó\ïû\r\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0üw»v\í\ÖÿÛ¿ı\Û	ï©¡\Ñh4\ZFK÷ö“Ÿü\ä«K.¹d¤·ü\î\0\0\\jxœ¼\ã;\ÌÂ…\ÍÑ£G\r\0\0\0@:s\â\Ä	³b\Å\ns\ï½÷~s\Î9\ç¬Cn\0\0\0$0=ô\ĞFI\r\0\0\0\0(\Í\ï~÷»=\Ş-S\î\Z\0\0¥Ÿ(R\0\0\0\0J³jÕªC\Ş-\Óz\î\Z\0\0\ÒO\0\0\0\0â ´”\Åu7\0\0\0 Q\Å\0\0\0\0\Ä±\0\0bbCû4k\Ö,b\İÌ™3\Íy\çW\æ>Ë–-³…¸´|üøqs\êÔ©Rıtœ6mÚ”j3fÌ°û<x0\Üw\ïŞ½f×®]ûŸq\Ææ®»\îŠû>´\ÏK/½dµzõjó§?ı\Édee…_\ã?ş\ã?¸{\0\0\0\Ä\0\0@ªŠ\r\É\í3fÌ˜ˆõS§N5ÿôOÿ±N\â¿ÿû¿\í6\í#ğ\Ö[o\Ùe·N\"\ÃÏ‘#GlÈ§¥Ê¨\ïOú\ÓR\"C\ë§OŸn›9t\èP+X´<a\Â»]Ç“H™?¾9û\ì³Íw\Ş~\Ï:¦\ãğ\á\Ãa\0\0\0€\Ø\0\0\0HA±1i\Ò$Û¢‘$øŸÿùóø\ãGˆ	\ìØ±öQR#Zl,Y²$\îkšõ\ë\×\Û~û÷\ï\ÙG¢£¨¨\È6Iõ\íİ»·Ù²eK\ÌşzİŸÿü\çö=\Æ«V­\â\0\0\0\0\0\0©(6\\\ä„RJ\Z6lhSR”\Âñô\ÓO›s\Ï=\×0À\ìØ±\Ãö•´Pÿq\ã\Æ\Ù\ÇÑ£GGˆ)S¦”)7\Üv	‡\"/\ÄÆ\í6¥–(\nC\"\Ãkö\ì\Ùfò\ä\Éö¹–Å¶m\Û\ìñU¢ö\ä“OÚ¨“³\Î:\Ët\í\Ú5\"\ÂC’\0\0\0\0±\0\0bbCRBR\ãÁ´\Ï×®]\Ş+E¸4ÿ>.#\'\'\'œ*¢ÈŒ[n¹\Å\Ü{ï½¦E‹öxŠ¼´„\ĞsEŠ¨ÿ\Ç¾É\Ğø\×ıW³`Áó\ãÿ\Ø<ñ\Ä6rCi0~)\â»1±òE\é+J…‘ü\èĞ¡ƒ}l@1U\0\0\0@l\0\0\0¤\ØP\Ê\ÇÜ¹sm±M5¡¨E<\Äªi¡h\ïÿû¦cÇ¶\ê[¸HIˆ²ˆ\'K¢o4$7\Ô÷\ßÿı\ß\í{\Óñó›\ßØ‚ ~\\ª\Ê\ßşö·pŠŒ\Ö}ğÁ\æ\'?ù‰•!ñŠš\0\0\0b\0\0\0’Xl¸Áşş\ç\Ú\æÿC¯šñ$„Dú¸\Ô\'E\Z”\ÔÜ¨ª\ØP”‡¢.tI\Íf\"¡q\Ûm·Y™r\İu×•\'ÿü\Ïÿl£;\Üëº¢¢¿ü\å/m‰fU\0\0\0@l\0\0\0¤˜\ØpD‹ò$„‹’p50%\án\ÜrUÄ†›\Åm×²\ê~\è½ùÅ†›\áDu3‚Á`DÁP—¢gĞ A\á4\0\0\0\0\Ä\0\0@\nŠ\rEF\\yå•¥\Ö+ZB\ÅA£qQ¯½öšŠ|x\á…\ì\r‚j`\ÄBu9Ô´=\Ö1Jqùõ¯m#-\\\ä†…Ä†¦™UıŒÿú¯ÿ²J3q²\Ä?ŠPEs8\Ù\0\0\0€\Ø\0\0\0HQ±¡ZJ÷ğ‹7«+\êX½zµ’P…d†Á!\Ñ¢1\ÜL*š±$:¶\".ü$J5Q=Í‚\â\":ü³œ\èõn¾ùf+0tl½Eu\ÜÿıvYòEµC\0\0\0\0\0\0\0)(6\â«\à&E8\0\0\0±\0\0\0I!6\0\0\0\0\0\0\0€\Ø\0\0\0\0@l\0\0\0\0b\0\0\0\0±\0\0€\Ø\0\0\0\0@l 6\0\0\0\0\0\0\0ˆ\r\0\0\0@l\0\0\0\0 6\0\0\0\0±\0\0\0€\Ø\0\0\0@l\0\0\0\0 6\0\0\0\0±\0\0\0€\Ø\0\0\0\0\Ä\0\0\0\0b\0\0\0±\0\0\0\0ˆ\r\0\0\0\Ä\0\0\0\0b\0\0\0\0\0\0\0ˆ\r\0\0\0@l\0\0\0\0 6\0\0\0\0\0\0\0ˆ\r\0\0\0@l\0\0\0\0 6\0\0\0\0±\0\0\0€\Ø\0\0\0@l\0\0\0\0\0b\0\0\0±\0\0\0€\Ø\0\0\0\0\Ä\0\0\0\0b\0\0\0\0\0\0\0ˆ\r\0\0\0\Ä\0\0\0\0b\0\0\0\0\0\0\0ˆ\r\0\0\0@l\0\0\0\0 6\0\0\0\0\0\0\0€\Ø\0\0\0@l\0\0\0\0 6\0\0\0\0±\0\0\0€\Ø\0\0\0\0\Ä\0\0\0\0b\0\0\0±\0\0\0€\Ø\0\0\0\0\Ä\0\0\0\0b\0\0\0\0\0\0\0ˆ\r\0\0\0\Ä\0\0\0\0 6\0\0\0\0\0\0\0ˆ\r\0\0\0@l\0\0\0\0 6\0\0\0\0±\0\0\0€\Ø\0\0\0@l\0\0\0\0 6\0\0\0\0±\0\0\0€\Ø\0\0\0\0\Ä\0\0\0\0b\0\0\0±\0\0\0\0ˆ\r\0\0\0\Ä\0\0\0\0b\0\0\0\0\0\0\0ˆ\r\0\0\0@l\0\0\0\0 6\0\0\0\0\0\0\0ˆ\r\0\0\0@l\0\0\0\0 6\0\0\0\0±\0\0\0€\Ø\0\0\0\0\îV\0\0\0\0\0\0\0ˆ\r\0\0\0\0\Ä\0\0\0 6\0\0\0\0\0\0\0€\Ø\0\0€º\äÄ‰Sq·:uª\ÒÇ«\Ê>\0ˆ\r\0\0\0\Ä\0\0@¥yu\ê\nóV`u\Ü\íGŸ0/¼»\Ô.OŸ¿\Ù>\İf^yo™\É_¸ÅŒ­-Õ¿\è‹#&o\Â\â¸Ç›½t»\İWÇ™öIññ^œ¼\Ì,^ûy•s\ïÁ£œL@l\0\0\0 6\0\0 ø\ä³]VZLœ½>¦pxı\áJ3x\Ü\"³y÷fş\Ê]\æ³-û\Ì\á£\ÇcSòC­<–m\ØSŒ8´mk\á¡ğó÷\çm´\ïE­ûK³\ÃË®\é½ 6\0\0\0\0\0&,\\]hFN[a—•:ò\ì\Øf\Ãöı\á\í\ÛY‰1ğ­…VB¬ó¶)RC;Š¾4\Şø\Ä\Ê5I­S:i‰YºşóğsEo(Š#šI\ë\Ì\Ì\Å[K­\×{\É\Î\r\ÚEvH¸8\â	\0\Ä\0\0\0b\0\0R¥‚¼>}eD\ÄÃˆ÷—›>#ç˜¿¾>\Ï\ì\Úû¥\í7xü§VZä½³\Ø?~\Â|s¡\İW\âBıc\Ñoô|\Û7š›ö˜l	¿\ŞÓ£\æ…S[”’¢\ç®6‡RKº¿8;\æñ‡MZj·;q\Òg\ä\\û€\Ø\0\0\0@l@Š³m\Û63o\Ş<ÌŒ3h	\Ğòóó\Í\ìÙ³\Íúõ\ëù‚B!Á \à$‚¢0ü<r<\ÜO\Ñ’ƒ\Ş^d#8$C”º¢}\ÉÍ\ÃGm„†DEy<3ö“¸\ÛŞ™¹ÖŠXô1\'\âyÿ1ó9©€\Ø\0\0\0@l@:H‚‚STTd?NK ¶g\Ï3s\æL³n\İ:¾¨P\'HJ¸¢jO˜^öUZŠ¢7¡!\Ñ ¢EL(\"#VÁQõQ´‡\n’–G,1\âPZŒ$J,\á¡÷\éPŠ‹j\0 6\0\0\0\â(R©‘\ØrC‘4\0u…jf\ÌY±\Ã\Ö\ËP\áP¥r™¸$¼]\âB\ëT4TŸ²\Ü\Z\İPRgC\Û}…=\ÅÜ•;Ì¸\à\Z»¬”?š^VQ ñP\ZÊ”¹#\Ö\î?bSb¢E‡^«\"r—ˆµôŒXCl\0\0\0 6 E\Ğ\Í<!±›nôê’\Ã?¶ò@BC²á¨¯6†Štª¨\äú)EER\ÃI	‰‡\"9TÔ¢=TœTıı¨>\Æ\ÛùkJõw¸Â¡j®V‡R\\$WübFQ\'O¼òq8¥†ˆ5\"\Ö\0\0\0ˆ\rHa4h\æ&\Z± (7«Ä€\Ò=\ŞûxƒmZ§\ÙFÜ´©š5E2C©%’şUŠŠ\"74³I¬\â\Z*0\ê\n‘:$)» B¢”…f])X¶½\Ôz½WM;K\Ä\Zkˆ\r\0\0\0\Ä 6\Â\í\Ë/v›MGšUùOÙ¦e­\ã\æ±@\Ä\Z-¯ˆ\r\0\0\0\Ä¤‘\Ø8|`§Y9½§Y6µKD\Ó:m\ã\æ±@\Ä\Z\r±\0\0\0ˆ\rH\Øû\í«\Ş+%5\\Û±j\n7ßˆZgË–-ü²k\\ÿ\0\0\0ˆ\r€ª\İØ¯=Wlh7ßˆÚ¤oß¾v\0¢G@±\Æõ±\0\0€\Ø\0¨ôı\Ê½\ãŠ\rm\ã\æ±Q[<ó\Ì3\æ´\ÓN3W^y¥}|ò\É\'ù¥E±\Æõ±\0\0€\ØH_8`&Nœh`zö\ìiÚµkgš4ibşò—¿\ØÖ¦MÓµkWó×¿şÕ¼ù\æ›fÓ¦M\Ü\Ø#6õ,5œ\Ì\Ğ üô\ÓO¯W¹==)²ˆˆ5®Qˆ\r\0\0\0@l\Ô	ü±eeeY¡ñ\î»\ïš\åË—\ÛişN<\î·o\ß>³f\Í\Zó\á‡šš¦M›šnİº™w\Şy\Ç\Ş`¥ë½r\Ê\ã\İ\Øk7ßˆÚ–\Zå­¯(šŠ\ÔM1ª)I5M©\Ú+\ï-3Ã§,÷Ó´¦óW\î*ı¾\Æ~‚,B\ì\"v\0\0\0€Ø¨;6n\Üho\Ø\ï¿ÿ~3~üx+.*\Ã\×_m\æÌ™ce\ÈC=d&Mš”–7ö\ë\ç‰{c¯m\Ü|#6j:M¢,y\á¶W%¢pÿóÂ»KÃ‘\Ó>\ÙlŸKd>\Z)/Ÿ» \Ôşƒ\Ş^d¶ò\Î\Ë	db±\Ø\0\0\0\0\ÄF\íò\Ö[o™V­Z™Q£F™#GTûx.4­[·¶©*JiI§û};—›•õ*}S\ï­\Ó6n¾5-5Ê“\ÕŒşp¥Y³u¯ùhÁ3>´\Ö\ì(ú\Ò<=j^©~sW\îGv¼1cµÉ›°\Ø\Ê\É\rdkD¬!6\0\0\0\0±Qk<ÿüó6\Â\â\ÓO?­\Ñ\ã:t\È:\Ô\Üw\ß}f\ëÖ­isc¯¶y\Ñ\èR7õZÇ7b£¦#\n*:¸®lÿ\Åk?7¯N]a\ŞûxƒÆ\Ìx}úJ»^¢b\ä´¶ŸRP\Ş\n¬¶M‘C&.±\ë§\Ì\İ3=YD\Ä\Z\r±\0\0\0ˆ\Z—\Z\íÛ··õ3jUı\r\Õ\éH±q\ì˜Y?÷…\Ò7õ\Ş:m\ã\æ±Q[i5-7u!Y\á\êi(µ\ÄEfLŸ¿9\ÜoRÁ:³l\Ã»ü\ì\Ø\æÔ©Sf\è¤%öY”^bƒˆ5\Ä\0\0\0 6\ê<ı¤¶¥†cò\äÉ¦Y³fI¹QŞı\á;Íº9yqÿc©m\ê\Ã\r8b£®¥FUö¶¤n†\ÒN”^¢\È\r=·\È}ñm\ÊZ\Ş;‹KI­C¥Ÿ\Ø b\r±\0\0\0ˆ:C…BUSc\éÒ¥uöšcÇ5>ø`RÏ˜÷\Æş\Ø1³{}Ğ¬øğñ¸R\Ã5õQ_¢7UM“¨núCE£\ÙO6l\ßo#2\ÄÀ7š‚e\ÛM\ß\×\æFJŒ	\ßJŒ£\ÇO\Ø4\ÉdQ\ZŠ\r\"\Ö\0\0\0€Ø¨+x\â	[(´®\É\Î\Î6ƒ\rJ©ûò¢4ˆ\Ş@lÔ¤Ô¨©È€²\ãW\ÚZŸm\Ùg†MZj>ùl—MI‘´8pø¨*&º÷\àQ3\âı\åf\æ\â­6mE\ÓÃªßœ;\ìvÍœ¢TE\é!6ˆXCl\0\0\0\0b£\Îøø\ãí”®51ûIeÙ¹s§iÒ¤‰ÙµkW\Ê\Ü\ØW$J£¬\è\rn\Æ•MwPÚ‡~‡+[\Ã\"z¿xiš\æ\Õõ‘Ì\È<şSó\×\×\çÙ´”o-´Û·²}…¦„}\ŞF[DT‘\Şø$fŠJºÊ¢”D¬!6\0\0\0\0±Q7ó\'N¬·\×8p`\Ò\ŞøÇº±¯ª\Ôp›q\ÄFe\Ë—\\r‰dè±¢\â \Ş~\éV\0³¾dQªŠ\r\"\Ö\0\0\0€Ø¨s8`²²²Ì¾}û\ê\í=(j#333)kmT´x\r±Q[\0\ZD—0*,7üRÃµ6mÚ¤U\Z²ˆˆ5®ˆ\r\0\0\0\ÄFŠ H={\Öûû\Ğl,}ôbƒ†\Ø(\'M\"Z6Ä’e\r\Æ+\Ú?]\n`\"‹ˆX\ãú‡\Ø\0\0\0@l$90S¦L©÷÷1lØ°„º\á\×À¦\"¢±Ø¨\ïU<©\ï?ş••• \Éi°w\ï^db—†\Ø\0\0\0€tŠ\ÖX¾|y½¿\Ø\éf…¿ü\å/¶i \Z¸±\çÆ¾N¿WU‘\å\r®+;X÷¿şé§Ÿ°ƒq¥\Òõ\èÑ£Ò‚Y„\Ø\åú‡\Ø\0\0\0@l¤\íÚµ3EEEõş>\nM\ãÆn\0\êZ\ëÖ­c\Ş\èscØ¨\ïUUÿ\Ão}\âÄ‰*IdH£Ğ¬J\îó|ú\é§m\İ db—†\Ø\0\0\0@l¤\Zœ<y2an¦u\0\ê¿\Ñ÷D¹±Gl\Ô\Æ÷ª:i±\Û\ßù\Îwª,5=B…‡£?Ï—^z)n1bdb—\ëb\0\0\0±‘b$šLHô¨ÿF_ÿ\É\ä\Æ±Qß«\êzc\rÆ«#59\"\Şg©•\èi¬‘Eˆ]®ˆ\r\0\0\0\Äõ:\èK\ÄV_7ös\æÌ±`µŸı\ìgö\Ñm\ÓÔ½ú”\ÚoÏ=v\Û\Ûo¿^·cÇr_Oû\ä\ä\ä”\Û\ç\ÑG\r/«(­[V\r•úº±O¶\ï\Ô=÷\Üc?³+¯¼²Z¿OŠ(ˆ|\ë¹\ÖW½¯\è÷¬¨	¥’\éz\"¡Ğ´iSÓ¼ysÓ¢Es\ß}÷\Ù±fiÛ¶­yè¡‡L‡Lvv¶y\ä‘GL—.]L÷\î\İ\ÍO<azõ\êe¥Iÿşı\Ís\Ï=g\r\Zd†b#0†nFm\Ş|óM3a\Â3yòdóÁ”ûy6k\Ö\Ì\îƒ,B\ì\"6\0\0\0ˆ%QjlhÀ\È56\\\Ó`mÜ¸q\á0÷úº±\×÷ô\ÕW_5‡¶Ë¯½öZx›jhş³\Zk¿ó\Ï?\ß\n\Õ4¸\Ô:\í\ã\ï7k\Ö,»]ƒB=^x\á…\æ\Úk¯\rï§¥„Jô±5øt\ËcÇ-µL\ÄFÅ¾W\å¶L„A¸\Ş\ëÁƒm\ÑNÉ±7š\Ï>û\Ì,Y²ÄŠ,‰5\r~%\ÜwF‚ArB\ß]\É\nI‹Áƒ›Z™¡\Z½{÷¶’C²\ã±\Ç³òC\ßÓ‡~\ØJ\É\r¬%K$MRU!viˆ\r\0\0\0@lT\r V­ZU\ï\ïC¡–-[&\ì\04z\àYß¡\Øú.^¼\Øô\ë\×\Ï.¯_¿\Ş\Ü|ó\Ív\09~üx»\î\â‹/6kÖ¬	\ï3o\Ş<;¨¼ô\ÒK\í²£\ê7iÒ¤˜\Ç÷Ëˆ\ï~÷»vj`÷ü¬³Î²O-k@«\×\Õ>7\İt“Ñ²¹\îXšygÑ¢Eˆ\n~¯H›¨¾,’´6mZ©š‰,‹»±\Û\æÍ›#D­>s\'×¢›®‹\Ú~\ä\È½æš®Gº\î•÷:ş\ç¾şkh2F²!6\0\0\0i«ş›ÿúbØ°av\Ê\ÆD»±W(½ş\Ë¯a}‹\rı÷ZËŠxñoSó÷ß¾}»]wô\èQû\\R¢¬kı\'^\Çßµk—m.\ZCËºÑ¿\à‚b¾\'\Ä\Æy\çgÿK¯eı\×^z\Ø(ÿ{U\ÕAoºº\ÔÀ3zğİ­[7û½®I9“\î²(Ä®>c‰	—j\ïÚ¥mNº*eO\×F·O£F\Âıt-3fŒ¹şú\ë­ğ}ù\å—Ã¢WŠr’X’$Y#\Ù\0\0\0ˆ´@7nú¯}£PóD,²ş“Hb£s\ç\Îvy\ëÖ­v½¤Cûö\íK¥—¸s‰¡C‡Ú›q¥\0(ò\â\ÙgŸ\r\è\×\Ğ\r¿Kw\ÑwE\Ëú\ã\ÙgŸ³¿wŠ\Ìpƒ·şŠ+® ¥ß«ª~kkjR}ujR}\ß]	\r\rVk:B\"gEI±«\ë‰R\í~õ«_Yy k/º\è¢RQ.Z#:šB\éw7\ÜpC\Ük©ç–—.]\ZN\ï\ÓuU\Ëú^%k$b\0\0\0±‘\è†Mƒ-\r|\ë‹\Â\ÂB;0©\Ï÷PU\êSlè¿‡ªU\àn\İz\'üE•v¢›l¥¡¸ÿ^\ê^Ëªo\àfŠ\Ôğ¿†\î\æ\\õ´¬h»\îº+\ÜOµTE}\Ü\ç\áDˆ[ö+Mg±QU\ÊWTZTVn8	 iˆh\àÙ§O[\ç£6\"%\ÒQ%š\ØU´—„Aôús\Ï=7\â:$‘\à\Ä\Ãe—]fSó´^Ÿµ–õ()¢\èµXb\Ã	\\Eqø#6ü\Ñi\ÉÉ†\Ø\0\0\0@l¤\r?ş¸™9sf½½ş‹/¾h:uê””Ÿ]}Š\rEA„B!»\ìd…n \İ\rºnš\Ô\Ğ	uC~\ï½÷š•+W†ÿ›©\Úş\ï\è\×ğ\Ë	÷_MWƒ\n4ˆ{}˜µ_‰—XQ!ˆ\ê\Æ+;¸®hÿD—\ZÈ¢ô¸şUTlHr©Ÿ»¦It¨\Ïó\Ï?ı\á¬®“.\ÕDi(ºú¯¥º–9y\á—!\ÉÉ†\Ø\0\0\0@l¤\r\Z°ª¸Y}LûªA±¦ˆ\ÔM(7ö•—<ğ€½¡W¨µ{/\Ñb#\Ö~Jı‰W(Ô¿\Ş$õGlüğ‡?Œ\Ø?\Ş&•¯÷%©2z”TAlTo0ıŸ~ıg¹²±ãš5\Ò$E\é\'6\\TƒKq\×$W”\Ó5Eÿ5(©9$)¡¿/ºº6u\ê\Ôp\Ú^¼T\';TGCË’\Ç\Ñı“)’\r±\0\0€\ØH+4¢n\Ä\ê\ZMñ¨)¹±¯üÍ¾\Ë\Í\ÖwVED]\İ\Ô7ˆJEqM34ğ¥œ8	R^(´ÿ\æ?º\éõœ¸\ĞM»\"3\Zø\n˜6(©k ‚Ø¨z¤«\áTW¦\ÆC¼ıq–dQú^ÿ4S‰®’\ßgœqF¸\0¨$†¢\Ñ\\?w\İQ\İ¥“(5¤k×®6Z¬AI\ÍÉè©­]t‡®a.ª\Ì\É^wmK\æH6\Ä\0\0\0b#­P\á\ÎÖ­[Û›¾ºbÉ’%&++«N_3Ä†nô¯¹æšˆ\çn†\0\İ\Ì\ë;|ûí·—*ª§ÿ2ú\İ)º¢A\ÔLe‰\r7Ma¬¦m\r|a\Ö~	¢m¿û\İ\ï\Ìm·\İ1Al\Ô\\¤\Õ\ZDWvV\èıª;%*²(½dQm_ÿt]\Óõãª«®²…’¼Pjˆ›\îZ\"\Ã/Yİ²jùEE¬\è]¯´\í\Î;\ï´\ézz-‰¡ˆ\r	_	ÿddCl\0\0\0 6\Ò…Gk¦ŒºHI\ÑÎ”‚¢Bn\ì¿\ÕW}\ÄF\å\Ó(j2r!@%\ÖõÏ¥•Hœs\Î9¶>P´0Œp‘a¼Z\Öl)ŠØˆÛ‰\r-K°º)°cE¶EGY\Ä²\ÉÉ†\Ø\0\0\0@l¤º	R¶\n£\Õ&EEEö¿\\û\Ûß¸±§!6@nÔ´$A¥‡,ª«\ëŸ\n‚¶k\×\Î\ÖR‹%:œ\ÜpËŠòĞ´\ÖŠ¼Ğ£Ú7\Ş,óKòTT™úøky\\ıõe\Ö+JôH6\Ä\0\0\0b#-Q$…Bp\'NœXkÇ—\ÔH•}\Äb#\Ñ\Ò(\êz\äFúÊ¢t¿ş%C$b\0\0\0±‘¶¨š\ä\ÆÈ‘#kô¸ª©¡ô“Tˆ\Ô\à\Æ±‘ˆr£²ƒ\èt+Š,\âú\Çõ±\0\0€\ØH³È|\ĞÎ–¢<\á\ê \êğšıD…B“½¦7ö\ÜØ§J¤\é\'\È\"®\\ÿ\0\0\0ˆ´`Ğ A6\ÊBbbÓ¦M•\ÚWy\Ë/¿ü²\İ_\ÅÑ’yönì¹±O%¹¡::ê§‚Á€,\âú\Çõ±\0\0€\ØHy$$úô\éc\Z7nl£84sÊ¬Y³Ì¶m\Û\"ú\íÛ·\ÏV°6l˜ö.33\Ót\ê\ÔÉ¦¶pcOCl$F\Z…+h‰\Ô@qı\ãú‡\Ø\0\0\0@l¤%š\ZO’£u\ë\Ö6C\Õ\ã]“øP%ù=z˜iÓ¦\Ùn\ìiˆ\ÄŒ“~‚,\âú\Çõ±\0\0€\Ø\0\àÆû¤”H\rd\×?®ˆ\r\0\0\0\Ä\07ö\Ü\Ø\'\å`ü\Ê+¯Dj ‹¸şqıCl\0\0\0 6\0¸±\ç\Æ>9\Ó(”*Æ”®\È\"®\\ÿ\0\0\0ˆ\r\0nì¹±OJ$6\0Y\Äõ\ëb\0\0\0±À=7öˆ\r\à3\åú\Çõ±\0\0€\Ø\0n\ìiˆ\r\á|¦\\ÿhˆ\r\0\0\0@l@½£\éo¹yFl0\ç3El\Ğ\0\0\0€Ø€¤¤  Àq ­°°\Ğ\Ê\'\á\ÂùLˆ\r\Ä\0\0\0b 7n43g\Î4Ÿş97\Ñ	*5Ö­[\Ç œA8Ÿ)kˆ\r\Ä\0\0\0b ,¹\í\r$-q\ZRƒA8Ÿ)k\È\İÚ‹XCl\0\0\0 6\0\0„ó™&½\Ô%b-}#\Ö\0\0\0ˆ\r\0\0\á|¦)!7R%bMç”ˆ5\Ä\0\0\0b\0€A8Ÿ)pN\Ó\0\Ä\0\0\0b\0€Ÿ)pN\0\0\0€\Ø\0\0`À\Æg\nœS\Ä\0\0\0 6\0€ğ™rN±\0\0€\Ø\0\0`À\Æg\nœS\Ä\0\0\0 6\0\0°ñ™\ç±\0\0\0ˆ\r\0`ÀÆ€\Ï8§ˆ\r\0\0\0\Ä\0\06\à3\åœb\0\0\0±\0À€\Ï8§ˆ\r\0\0\0@l\0\00`\ã3\Î)b\0\0\0\0À€\røL9§œS\Ä\Ôõ÷™›6m\Z?şüS@ÀÌ˜1ƒ–\0-??\ßÌ={¯×²ø– 6\0\0°ñ™\ç±I‚‚STTd?NK ¶g\Ï3kÖ¬ƒùùù\æ›\n€\Ø\0\0`À\Æg\nœS\Ä@©\ÔHh¹q|ÆŒ«ù¦ 6\0\0°ñ™\ç±¥Ÿ »Í˜1\ã\ßT\0\Ä\0\0¶Øœ8q*\î¶S§Nñ™\ç±©\ê9 ^lğ‹€\Ø\0\0`ÀƒW§®0oV\Ç\İ~ôø	óÂ»K\íòôù›M\à\Óm\æ•÷–™ü…[\Ìø\ĞÚ˜ûôñq\Ü\ã\Í^º\İ\î«\ãLû¤øx/N^f¯ı¼\Ê?C³6\ÌŞƒGùrñ{‚\Ø\0¨m±ñ\å»Í¦…#Íªü§lÓ²\Ö!\0€\Ø\0\0lõÁ\'Ÿ\í²\Òb\â\ìõ1Å€„ƒ\Ä\Ã\èWšÁ\ã™Í»¿0óW\î2Ÿm\Ùg=ó˜ÇŸ0ƒ\ÇZ\îk/Û°\'®Ú¶µğPøùûó6\Ú÷¢\Öı¥\Ù\áeµ\æmµ\ï\rø=Al\0Ô¢\Ø8|`§Y9½§Y6µKD\Ó:mC> 6\0\0±\0\Øê’…«\Í\Èi+\ì²\ÒM»ÀlØ¾?¼}{\á!+1¾µ\ĞJˆu\Ş6Ej\èqGÑ—fÀŸD\ÈõW\ÔÅœ;\Ì{o°\Ï\ËbRÁ:3sñ\ÖR\ëõ^²sƒ¶\ÅB¯!\á\â`a\Ì\ï	b±u 6¶¯z¯”\ÔpmÇª)\È\ÄF]ğ|€\Ø\0\0`À&”\nòúô•Q#\Ş_núŒœcşúú<³kï—¶Ÿ\"/	‘÷\Îb‰1ğÍ…vß¥\ë?·ıı<3öÉ¡H‹›ö\Ø\åwf~‘¡u-\Ø~½§G\Í§¶(%E\Ï]=¥«tqv\Ì÷>l\ÒR»]rE­\ÏÈ¹¦q\Óûøbñ{‚\Ø\0¨m±±:ôL\\±¡m\È\ÄF-sk\É\Å\îV~c±\0\Ş6		\'…\á\ç\à‘\ã\á~Š†\Ìôö\"!¢\Ô\í«H‡B‘şc\æÛ¨XH„\ÄCBD¢#½GÌ‰x®\×`\Ì\ï	b±u 6V\Î\èWlhò±Q‹\Ü\âµ^Tòx¿µ€\Ø\0\0H\ß›¤„+Ú©ö\äˆ9\áeQ¥¥(zC\Z\r Š˜Pô†\ë«Ô”‚e\Û\Ãû)ºÃ¡c*e%~1\äˆ$J,\á\áŠ(úâˆ­ıÁ ˜\ß\Äb£Rô\î\İû†útß¾}õ\ì\ÙsO»v\í¾nÒ¤‰ıâ©µi\Ó\æ\äc=và©§Z:lØ°—x\â‰ÿ±\Ø@lÔ»Ô¸\Ã¹±¹ˆ\r\0€ô°©f†jaHJ¨p¨R:†L\\\Ş.q¡u*\Z*†OYnn(©³¡GWCc¯.‡P…_¢Äªµ¡\ée¥¡L™»1b]\áş#\ÒÄ‰¥·0\æ÷±Ø¨ıúõûC¯^½–dee}Ó³gOó\î»\ïš\åË—›¢¢\"sò\ä\Éğºo\ß>³f\Í\Zó\á‡š\Zõ\ì±Ç¶{û´¹é¦›\ÎLW±¡YP\â‰\rmC> 6\ê@j”·\0±\0F¶\Ã?¶ò@‚CC²AS»:T¤s\è¤%V¨ŸRT$5œ”hğ£ºª«¡\éc\ËBõ1\Ş\Î_c‹‡\Æ\ÂU;^ò~>j\åŠx\àL\Ö}\íLóv]Íƒ}F…ÿÁ\êoÍ›7\ç‹\Æ\ï	b¾%;;û§İ»w_zÿı÷3~üx+.*\Ã\×_m\æÌ™cx\â‰oÚµkWØºu\ë?¦£\ØX?gH\\±¡m\È\ÄF\rsk9ò\Âm§\æ 6\0\0\ÒhÀ¦\è	¥“¨)E\éšÁDM\ë4Ûˆ›6U³¦Hf¨¨\ä‡?DC)*~á¡ºJ)IŠ\ç\Æ.ˆ(e¡™Wü©.³gÏ¶Ÿa«G˜¬–mcŠq\ã\ÆñE\ã÷±\Åô\ìÙ³}«V­NŒ\Z5\Ê9r¤\ÚöÂ…M\ëÖ­¿nÛ¶\í»\r6üA:‰};—›•õ*†\â­\Ó6\äb£¤FyÒ‚\È\r@l\0\00`KJ¼1EL¡¡Ö¢E{ÿü 6 A·n\İ^zè¡‡N~ú\é§5ú:t\È:ôkï‚³«aÃ†?N±¡¶y\Ñ\èRbC\ëˆ\Z\ä–JFbT¶?\0b\0€[½\ã¢6bµ7\ß|“ˆ\ß\ÄKö\íÛŸRıŒ\Úb\ìØ±§²²²6l\Øği!63\ë\ç¾P:\r\Å[§m\È\ÄF\rJ;ª°\ßa\ä 6\0\0°%ªµ«¶\Ñ\Zü 6À¦Ÿ(R£6¥†cò\ä\ÉÇ²²²v&{\äFyb\ãğfİœ¼¸56´M}ˆz\Z5µ?\0b\0€[+jƒ\Ú\Zü 6À\nUM¥K—\Ö\Ù	x\ã7v5n\Üø½d1%®\Ø8v\Ì\ì^4+>|<®\ÔpM}Ô—\è\r\ÄF(¯Ph]\0±\0À€­NhÛ¶-\Ñ\Zü\0b#’nİº­P¡Ğº¦cÇ»222Ú§’\Ø(/Jƒ\è\r\ÄF\rKšJ#!r\0\0Ø’†@ \'N\äIRb¥1…/b£Jô\ë\×\ïšÒµ&f?©,;w\î<Ù¸q\ãı™™™?L±Q‘(²¢7ˆJH\'5NóZó’\Ç\Ê½E±\0€\ØHºA1\Ñ\Z\ÉKY\Å`I3BlTŠ^½z-©O\Ë9`À€U™™™ıSElTUj¸†Œ@lT2²BRbD\ÉmD%\äF¼ı€\Ø\0\0@l$Õ ’¦ğElT›Ş½{ÿCVV\Ö7ûöí«·±s\çÎ¢\Ì\ÌÌ½\ÉXk£¢Ó½\Òµ˜.Ò¼\äbf*!7üRÃµf¾\í\ÔÜ€Z£I“&?\É\È\ÈxEˆ\r\0He9\Ä~Û¶mfŞ¼y6C÷J´úoùùùVÔ¬_¿>mSø\"6ª\Ì/¼Ğ¿gÏõ~2|ğÁµ™™™ÿƒØ !6\âO6Ä’eÉXı‡\Ç\èO\Í\r¨¼›”Ÿ–Ü¬œğ\Úz\Ø\0€t¬\Õgˆ½¤FAA\ÑLˆ\Ü+&VÛ³g™9s¦Y·n\"¢°ˆ\ÊĞ·o\ßES¦L©÷“1xğ\à9‰”â½—-ˆ\r\ÄFm|¯Ê\Z·VBVÄ’•\Z\rHKÚ¢E‹ß‹ºq‘\àÙ¸q\ã+\0j$bˆ½\"5\Z‰-7Iƒ¤¶b£ô\ì\Ùs\Ïò\å\Ë\ëıdÌŸ?©÷\å\r%\Ğ\í/“¢\×!6uù½ª¢\\(OnTVjø_‘P¿\Ñ-†ü\ãn\0R6j£¾B\ì5h\æ1ñ\ï_\Ó¦ğElT™v\í\Ú}-c[\ß\îö¾À»ø¦ûƒXÿiGl 6j\ã{Utxr\ãô*Jò\Ò`\0jTlø7J\äw+\0ô$Zˆ=÷¯ˆD…)|U¦I“&\æ\äÉ“	qBôN¶ÿ&ò‡±QKÿ¥®Š\Ô(Kn¬­†Ô¨\îûß¹iÓ¦\ÍYJ\ÅhÚ´\é\Ù\r6<\×kÿ\×\Î\Ï\ÊÊº@\Å47n|±\×~\î\r\ê/ñÚ¿y\ír¥hx\í\×^û/\ïûò\ß^»\Ñk7y\íÿó\ÖıÁkÿ\ç}\îôÿ\Éköš·[F¯5óZK\ïyk¯µõ\ÚC^{\Ø[\×\Ùk]¼\Ö\Í{ş„\×zy\í)¯ı\Õ[÷Œ\×zm÷<\ÏkÃ¼ö’\×Fx\í5¯½\î½Ö›^\ç-OğÚ»^{_\"\Âky\ëƒ^›\å-\ìµù^[\èµ\Å\Şñ–{\ë5\Ö\Z\ïùú\nˆo¼¾§\0ªQõb_\Ñû\×/¿\Øm6-iV\å?e›–µûK\ÄF]ˆ@¢5•h%\n\É 6¢ÿ›ˆ\Ø@l\Ô\Ò©«!KnTGj”J‹ñ\ãgx\í;w\Şy\ç\ßıñ<\Ç¬ÿƒ7ı¡\×~\äıÿìµ‹¼\í?ó\Ú/¼ö¯\Şú÷Ú¯¼õWz?\ã5ú95jtƒ·\î·^»\Ùk¿óÚ­\Şú;¼v—\×\îñ7\Ê,&\ËÛ¯…\×Zy­·\íAo]¯e{\ío]W¯=îµ\Şó>^{Z5{¼\ç\Ïy\íy¯\åxmˆ·ß‹š\Ã\Ûöª÷|´\×\Şğ\Ú[Şºw¼6\Ék\ïymª·nº\×ò•\çµ¯\Íõ\Ú\'^û\ÔkJ›[\áµÏ¼¶\Îk½¶\Åk;u\æµ\"¯\í÷\ÚA¯}\éµc%5$¾)i_{\íhÉ¶/¼¶¯dŸ]^\Û^r,sm\Ék¬ğ\Ş\Ó\ïqQ\É{˜\ãµ\Ù%\ï-\ß\Ûö¡Ş³Ş»÷|¢\×\Æ\ëgò~\Æ1^¥ŸU?sI‘\Î!ú,¼uóÚ³%ŸQ_¯õ.ù\ìº{\í1}¦úl½ı\Ú\ë³\Ög\îµû¼u\Íu.¼u2\'\rut®¼m·\ë\Ü\éz\çô½ö[oıµ^»Z\ç¼I“&ÿ\á}.\ÓwAß‰2~>\Õqõ½\Òw±\0©B\"…\ØW\äşõğf\åôf\Ù\Ô.Më´{\Ìê·£G!6\âˆÀ{î¹‡‹b#¹#6’­Õ†\Ø8|ø°Y´h‘™4i’yùå—­µÔ—uô\è\Ñ\á>;v\ì//]º\Ô>9r\Äö3fL\Ì\ã.^¼\ØnW?M\ï\ë\ÚgŸ}f‹H•õ6o\ŞñüÀfÍš5qû\ëurrr\Ê<¦ú<ú\è£\áe±u\Ë,¨±\Ï3Ù¾Sº—\\œUó\×ûô‘\ZkK\ÖW‡A%\ïõ¤×{\íˆ7 =\ä\rFx\Ë{¼Vèµ^\Û\æµMú\ï|\É\éWzm™ş{\ïµ^›Wò_ı™^\è¿ı%ÿõŸR h€·½6VQ*.\éµ\á%\ÑÃ¼\×\ËUT¢¼\ç¼\ÖOQ\Şó\'½\ÖC\ÑŠJğ\ÖuR”‚¢¼÷ñ€\×\î/‰bh\êµÆŠnğ\Ö\İëµ»õ \èoû\ï\r¡¨E\Òx\ízEKx\ë¯ò\Ú*ŠB\ÑŞº_*ºBQ\Ş üB¯ıX\Ñ\Şóó¼k\ë\ß+*C\Ñ%SYŸ\Ö\0ü’ow\Ôw_R§EŒi¿¹[€” ‘B\ì+rÿº}\Õ{¥¤†k;VMALxmË®ıf\ß_\Ú\å•?7«6\Ù6cÁ&“¿ğ\Û{\ç\Ï÷2\ë·\í-µÿÛ\Ï1\èÛ·¯½o\Õ# 6’®\ÆÆ={v%x\r\×\ê?\Ê\îæ»¦Ä†\n¸N:\Õdee\ÙşE]d6n\Üh=j%‚¾¬+W®Œ·\ß~»ù\àƒ\ì²DÈ„	Ì~ô£pÍ-ºw\ïn—\çÌ™c+.Klh}£F\Âıv\í\Úe\å\Èõ\×_oeŠ\äŠúH´\èñşû\ï7\ãÇK\í3k\Ö,3yòdÓ¬Y3ûx\á…šk¯½\Ö.«\é½ı\ìg?+õ~†^;vl©\å4ŠØˆø^5(”\êDlŒ¨‰ˆd¿öõú^…ûö\î}ze÷)ÿ˜¡3\Ó\\ll.ù\î\ïVdHÃ†\r§+w+\02$Jˆ}E\î_W‡‰+6´\r±q\ÜJ\çoG^,]_hŸKd>òUD\ßñÁÕ¥öŸ4k­Ù³ÿ°ùê«£ˆy\æs\Úi§™+¯¼\Ò>>ù\ä“\\8£G{W­ZU\ï\'£dV”‚€F<k¼Æ†¾ƒ/{¯^ş\Ío~Sª¯d‚“\r………öñ\æ›o\Ë=õ\ÕW#¢5¢£)\Î?ÿ|s\Ã\r7\Ä}?:[Vdˆ_{\í5³u\ëV»,	KF|÷»\ß5??ë¬³\ÂRE\ÂÆ½?ıŒo¿ı¶]V\äˆ;–DdM\Zˆ˜\ß+ŸD8\\K56ª\"7\ê¥\ÆF‡\Üi\ß)7ø[÷<;\'0XŞº>±úw\Î	ş_vnğòDE§\Ü\Ğ8\',JÛ´\ã\àü_\Å\ê\ïoTñk\Ø\ÇAù?÷o8\'ty§\çfš}ksòÿ·cn°ß·?\Ç\ìó#~õ\Ë	õˆ>\Ş#Cw\Ê	5÷\ŞÏ£\Şû¹¦S^°]ø¸¹¡&‡Îº(E\ÄF\Ò]\ÑRNW\îV\0 )\Ñ=\ÒÈ‘#w¯mZµje\Z7nq \çš\îµS§NfØ°a66‘\Ä\Æ\Ê½\ãŠ\rmCl|\Ûf.\Şbv}aVlø\Ü\Ì_¹\Ã\ì=ğ¥3}e©~\ë¶\í	Gv,\ÛfŞŸ³\Ş\Ê\É\r\ÄÆ·R\Ã\ÉElœ~ú\é\È\r\ÄF\Åğ¾0‹¦M›V\ï\'\Ã\Ğ+oü¹€\ÎSˆzœgŠ\rEd\èK¹}ûv;È—¸Ğ²\ÖE§‚h\"<$.\\Ä†$‡ŞRY\\I‰\'.»\ì2+?´]\ÑZ\Ö\ã\ÙgŸm_+–\Ø\Ğñ\\Š‹?b\ã‚.÷=xğ •\'ú#®\æ¢1´¬?\Ôş¾ñ\"6\Î;\ï<Ù¡e‰¢\ç)*6\Êü^U#B\"Ş”®±fE©ŒÜ¨\×YQ²ó‚¹NH8 Á\Ñih\è±úw\Ê´Œ\')DÇ¼P«\è\í\Şk¼qŒ\çvºC¢D‚¢SN°×§gvn \Ó{şpY\ï·Sn\è‰’\è¨½\çqqkvnpˆúØ¾y¡»\Z’ÿ.’£Snğ\Ù\â\åq\ßñ~–¶\á÷|>UşöTà»\Ø\0€„\ä\èñ1×Ÿ8q\Ê6\İ;ù\ëiT´y÷Vt¼ô\ÒK•\è8|´rı\Õo›w\î7ÁO·˜O\×\ì²\Ñ’³–l±\ë%*B‹·GPo\Ûk\æ,\ßf›\"3¦\Î\İPüOÇµ»c¦§¤«Øˆ–\Z\å­\ÄF)†:°_¿~õ~2Ú·o¯üû›h\0Z\Ö\ÒkEl*ESú‡\"#\\ƒ?J\Ã_“Â‰\r	WcC\ÒÁõÑ²¢+1¡\Ô­“\è8÷\Üs\Íó\Ï?>¶Äˆ¶91\âRMô>İ¡e—¶\"A\â\ä…_†4(©\âDˆ¡e½O‰“Xb\ã’K.	¿¶«ó¡\å+®¸\"USQ*ô½ªb¤D<©qZ\Û+\"7®öÚõ<\Ê\Ã9Á_g\ç;K.t\Ì4TÄ†¤ƒ?\ê\",\0rƒı$ b¦\ß\r\rıÀ\ÛöŠ\"(ığm4Dpˆ\ç\"\":\æ\Úw\Ìed\ç…zIj\èõIa›/ò\"\âua\ámpXÁyşõ\ä….\ÕûTSt‡í—›c±d	4ô\íÿ++:rƒ\Ã$_¬\0ñ~^­+–%Á\îiøgŠ»\0¨&\Î^ov}i\Û[\Õ\áõ\Ó\ço6\ãCkKõğ\êG\æşN½MfVsÓ¤yk“Õª}„¸h\ÚúaÓ¸\é}\áÖ¼]×ˆ\åfm:\Ù~\Í\Úd›V2}2O·E´!—\Ø÷\Íñ\ã\'L\Ş;‹\íòü•»jDlh”xbCÛˆ\Ô8n£.$+\\=\r¥–¸ÈŒ\å\ë\Ãı®\Şi¶\î>`—\ÇW›cÇ™ió6\ØG\ÄFqdFYò\Âm§\æb£Lºt\éò\ã\æÍ›£Aq}QXXX”™™ùeB’šJq53$\ÜÀSQZ§(	5I\n4…ä‡–U/CŠš…BbC\Ë.UEı$%t¾%\\Sô‡;v¼T\';”\ê¢e÷:şşú9\\š\É}÷\İg—­q\×]w}ûG  À†_:‘ı^]¤I*ŠjP^\ÄDyR£A\å†K‡¹»\"5nP*†üK4H<(’¢\ã\ààµ±SWl\ÊGõCz<,‰Q:\İ$ğJ¤¤^«\×U”„$„\ÒQ\ìc^\è\îN9\×UoCM¢\Ä5[C\ËzsC]\Ã\é%¹’:®\"7t	\ïu³õs†#4\åÿ\Ü{\Í7\ì{\Z’½\åAl\0\0\Ô\rC\'-1{5\Û™I\ë\Â\ë%9Š¾ˆ¼o\î\ÚûÓ¦\Û`“™\ÙØ¶\Ö]™f÷?dú÷\ïo\ïo”ö½{÷nû,±­ğ3!¸Ò¬[·\ÎU¿¦M›Z±Ñ²CO+;´Üºukû©‡\ÚH‘g\Æ~ñº’\Ã&-5o\ç¯ñ\×[\ÌÓ£\æ\Ùu¯¶\ØX?gH\\±¡mˆbI¡\Ç\×?\\i\ÓK¹¡\Çwg¯5û~\î7\å\ãõ¥$†\Ö1\İkÅ¥‘ˆ\nÑµk\×\r3gÎ¬·1dÈEš0?»š\ØPJ‡KË8\çœs\âÖ¿P\İ\r—²\á\ÒXô\Çó\â‹/ütHµ¬ºJ\'Qjˆw\Îm‹%53$;T¤4ú5´¿„‡‹$q$±Dˆ_N8)¢÷¨\×\Ï\Í\Ê\Ò ª`¨_½7÷šˆr#7**5*+7\Ü\ë\İ]Ÿ?´\ÒJ:É¿D\Ñóoºˆ†N¹\ß+’\"V´Fq]\âz‘)\"ù7J¸h\'”¢šş4õ\ë˜–\ÈõR\í¥†(\Â\Ãö”ÿs¿\Øğ;\Òÿ\\\ÍE”¨¯=¦¢Mtü¡ı¡T›ò\â=*‚£¸G°³õ 6\0\0\êI5I\ÉEB(Z¢Ë°™fñ\Ú\ÏÍ†\íû\í½S«Ú›u7™Mššû:ö1<ö¬yéµ·M¼\âü\'N2Ï]`v\î9±^÷G\ï¾û®\É~z„=V“\æ÷—Dt´2/¼ş¾Y³u¯yqò2\ÛWbE‘#z_z\ã‚kÌˆ÷—›iŸ¯\ë3r®•!\Õûv.7+?\êU:\r\Å[§mˆ\ãvö“\İ{Úˆ=\'´Æ¬\ÙRdF°\"¢Ÿji„ïƒ¿:j\ÓP$?\Ò]l8YQ\ÑHŒ\ÊöGl¤!İºu\Ë|ô\ÑGO\ÕÇ´¯\ŞEüD\ãÆ÷7i\Ò\ä\'\é.6\\*‰f,\Ñ\"š©D\ËZ\ç\êfD‹¥o(rÂ‰½	M—ª\çnf‰ÿô°~Q+:B\ÇÕ¶;\ï¼Ó¦\Ã(\ÄEb(bCµ/yı~T³#:b\ã‡?ü¡\É\Î\Î.·Æ†Ş³ûy]qRÿL0ˆp\äFtZHóJH²\äF³JDˆ\Ô]\ÔFI±Ğ’\åG¼ˆ\Ù77\ÔDòÀŠ„œ`EvDGs(R\ÂEHt\Ê\rõ•4± Q}‹\åC¨Iñ\ë§€(DQñ\Şk¼÷\å—(.:†R]t|DF‡\Üü\ËJR^nuEmß¼P+ÉšXi7ˆ\r\0€šG\â@‘¯N]a^yo™9u\ê”]?fú*!$5Z¶li²Z\Ït\"	ñØ€‘\æ—zı¿‰{ì‰³Ö™·ƒk\ÌÉ“§¼ñn+:ü|´`³Qı»V{™\æmµ­e‡\'\Ìë¯¿n…ˆ½?ªŠRd\n–m/÷\ç«\èı\ë\æE£K‰\r­Kw¡±q\Ç>[+c\Ç\ç_˜\æm4¶\ïµ))’±¢C\ÅD:b‹6›Õ›‹‹…jzXõ[»uİ®™S4ƒJ:ŠªF` 7\åÒ®]»B\rT\ë\Z\ïK¹\Üûc—¬Ÿ[M‰\rW$T\Ñ\rz®šø\ÃŠ§‡*Iq3™8ñ\à¦vu\é(’J;q©\'z*<ªeM!«ˆ\r¿\äğ‹\r-\ïØ±#ü^4\ßz,á²PÿòfT‰n.\Ú\ÃEi¸ˆ’¾Y[\Ü,.>ú(b#~ZÊ­1$EE¤Fƒrö«‘)]kj®h\'-\\\í\nW@42\Z#ø[\Õ\Èøöõ\Ç}\çùÍ—ÌˆLo	õ\nO\ßZò¨’ƒó\Õ\ïnSQ\î¸\å\ït\é,ş¢¡z*~ª(‘\â\â§Á\î+\ÅEI‹…†¤E\èL+4ò-µK¶\Øo-K¶ 6\0\0jE>|´`‹y\áİ¥fğ¸Evİ²\r{\Ì;3×†\ÓA4\ÓI±\Ğhiš·\íb^|}²Y²®\Ğ8b\Şø\è33ú\ÃUfÑšÂˆ\ãN_°\Ùüò¸\â\Ø\×\'m¿\Ã_}\î£\×ø\æ›oÌ„ÀrÓ¥K{ü\í{˜&\ÍZ™ş/N÷Û¼ûóÆŒ\Õ\á: j/\ë¶\ï¯±q\ì˜Y?÷…\Òi(Şº\ãeÔ†H—i^]j‰d†D\Æ\ä‚uf\ìŒUv6”	3\×\Ø\íEûÛ¾\Åuôyßİ¶ˆ¨\";\Ş¬™¢’b£ºi%¤¥ 6Ê¤M›6¿oİºõ×²\Ïu…7x]Ÿ™™¹¡aÃ†?Hg±¡ˆˆ\è©M¿ÿı\ïÛšş(‹%57…¡iZ£#,¢ú§[õÏªr\ÕUW™k¯½ÖŠE^\èQ\í\ÆoŒ8«Í¡B·\İv›\í£?\àªØ­\åë¯¿>,bb‰\rEy\Äû™µ­¯`¨_‚h\Û\ï~÷;ûšñ\ÄIš‹Xi)§•D\\Tv\n\×\èın­	©+zA\Ï5ªjPÄ’\Z\Ğ÷”\0ğ.?±4s¿W¤†÷ü\×nJUo¹C\É\ã\Í\î¸*.\Z=¥ª·ı\Ï\İG,\Úg‹r–D@øf&	O©:8ÿ\È\Ü\è)Uí±¼}†\Í>©<½–Œ4ß˜Á¶N†}\ßÊ‹6/Mù;½¿1«Í„bÁ¢unJZõ—”±Q$ƒó¤\ÙP\ìñómu¥¸„¥MTı}Vt”\Ôó@l\0\0\Ô>ŠÒ\ØPÊ‰jXH\Z(\ZBõ6ô¨•î‰²\îkg\ÓPŞ>×¼[°\Ş\Ì]±Ó¬İ¶ß¼?Wu1……Å‘c\'\Ì\'Ÿ\í²\"CL˜õmÍ-»Z™!¾<úµ™·J)/‡­Y½ùsó\ÄÀQ¦\éı›\æíº™\æt2K–,±}\ßûxƒı\áÊˆˆ~£\çW\è\ç+\ïşõğfİœ¼¸56´M}HG©\Å4—\å\n­\ë\ã 6R”¶mÛ¾3xğ\àu‘’²k×®#JAiÔ¨QRÃ«\é\Z©\Òjª>56*%7j#Í¥\Ê(\ÍCƒxE<Ø–|GBõ#$$/lBq\r‹¾\á©OsC\ï\é1ÿ°yÑ»T\\g54ô\Û\'7ğJq\Z»ÎŒ÷¶·ó\Úh\Ğ\ïO]ñO©ª>ş)U\á¦TU¤\ÄRc¼2\ß|\äö4C²…®°5<\ì{õ- ÷]\Æ<!-m¼uw?óş\çK§\ì6¯Ù¨‹\Ü`¥h<õ¶·\×l(nJWI•’\Ï\ÈN\ë\Äp5<\ÜT³’6º#/ø\Çx\Ó\Û\"6\0\0j\êT´†¢4v\íı2<\ÓÈ”¹\Í\Èwò#f;Qô©\",¦\Í\Û\Ş_\ÒÁ¡T=\r¥ Lš½>\âõ$>\Äg›÷Ú¶i\×VŒ¥-ô\ë÷W\Ó\ê‘¶0©\n°«6š\"3$YVl\ÚcFN[Q¼ÿ–}Õ‹\Ø8v\Ì\ì^4+>|<®\ÔpM}\Ô7İ£7•—5•FB\äb#.š‚²eË–›Gıum~ğEEE\'[´h±+333;\Ù?3\ÄFrüaH\á_Ûš’5&Il‘KEV\ä…zIdH\ØiUsCM\\\äA8¤$ıCƒ{—’at–‘rQ\×SªJ¤„\åLX\Òxû\n]\á~¥\ËÏ„¢”’b	\"	a\ÓPr\ÙZ\Ï_\Ä\0$ª³¡GÍˆ¢\éT—Èf\ÍZ„¥FÏ=Í±\ã_›·„å„¢-ü)(ŠJõ#i±x\İ\ç1_w\æ’m¥jn\è¸û|a\êırøu;>5\ÜÊ—Á\ã?µ}$3$5´®\ïksÍ‰§*-6Ê‹\Ò z±Q\ÂI\rÕ­ÑŒ®~ME‰Şšˆ¸dffş°iÓ¦û&Nœx¼¶\"5J¤FÿTø¼ˆ º\é#5–~ò­<^+ù q`£ò-‹\ëU\Ø4ö®Ÿ\nwJHB\Ø\çŠLP]‰\Ü\à×§¾§Tõ\ŞK@\â\Å\ßl4F^°}\ÏCg]TœfºUR\ä\ÛYT‚/¥i±O\Ä\0$5ª]¡i^\İ j\á\êÂ°\ì\è1djX.´lyŸY´r“M=q\ä/\ÚjFL]a#8„\êŠy÷¼vF:Ç†\Ì\î}_\Æ|\í\Ğ\âm¥\Ö\éX\Ì\ßd&LŸo_73«¹iÖ¦“MeVıS\ÊLY³¡”%6*¥QVô÷œˆŠFV\è÷\ê’K.±ƒq=VTn\Ä\Û¹Øˆ‹f(\É\Ê\Ê\Úùê«¯\Ö\ä®š\ZJ?I…H\r\Äb#A\åFe#.j¤P¨-‘|\ÃN«ªiKU·B\Ï.”\è\Ğv+J¦?•ŒP}[K#78Dv\æ7I=O©ªZ.¢¤øX\ß\ÇL½\É´Tºˆ^³X\à\æ¯	b\0R‹x ,6T½<Tˆ]};w\îl*’\ê\í„H<~ı=zTù\çˆuÿZU©\á\Z÷œˆŠH\r¡ˆ‹¾™ù*\"7üRÃµ6mÚ„·§{\Í\r\ÄF9‘7~O³¥lİºõXu>hM\éª\ÙOT(4\Ùkj 6)”–R\Ó5:JøÁv’%\" gID_÷\ÜÅ T•y¡‰¾h‰¾.²\"n4HM©ª\è—š\"R‰\á\í§è“¼@[IŒğûV!Ò’\â£zVH²”Lˆ\r\0H~T\×\ÂI…&Mš(µº\Ü}\r\Zd#6´\ÏÄ‰\Ë\í¯i\ï\Ëb\ãÆõ=ö\î\İ[cbƒ†Ø¨i\âÉ†X’¢,¹Q\Ñş\é\\s±Q222\Ú7n\Üøó§Ÿ~z…w1­TGaaa\ÑĞ¡C*JÃ»ø¾Ì³Ÿ 6)&7®ö\Úa¯\İ]oÂ¥›×§\İ\Ò)\'ğº«k¡õ6òB\Ñ\Z\Ş\à\ßI»\\,\rZ–ul7¥ªŸÚœRµ¸xhIM8Ó½º\ég‹_»x\Ù?M, 6\0 ù9rdX(ô\ïß¿\Üş\Ztµl\Ù2¼OVV–Ù½{w\ÜşË–-3¯½öZ¹\Ç\Í\Î\Îó\Í7\ßDl¤©Ø˜={¶iÛ¶m\ÂKx\é!••• éš–‚Ø¨ \ŞÅ³·×¶·i\Óf\í³\Ï>;/\n-Ş¶m\ÛVÿºoß¾\Ï\çÏŸ¿tğ\àÁsÚ·o¿233óËŒŒŒW”Ú’ªŸ\r	š–r¸Œô7û\ÉİµõT\ß\ÂJƒ\Ü\à\Ãv°Ÿ\ê/\ÚB}­\è(v&’Ô\è”\Õ\Ñğ\×èˆ’)5>¥jñ\'ß¦¸È“Ò²¥øxJ³±i4J\Ã\É\r h(b\0R¥~øgB)u\ë\ÖEDW(r#\Ş`kÿşı6¬Ş».÷¸o¿ıvø˜İºuCl¤™Ø\Ğğ§D%\"•\åI‹\ÊJ\rÿ\ëŸ~ú\éi¹Ø¨Z\Çu%’\ã¯mö\Ú	\ßE{·\×\æy\í9¯\İÔ¢E‹\ï¥ú\çÁ\ÄF’En\ÔJúÉ·i\Óş^¶nE^ğ\î,Nı(N\éğ×¯°<óo\Út”!¡ˆ÷ckr”¤‰„\åCñ1g)\Í#f\nLN¨yMM©ª‚ Š¸\Ğ{Œ\Şö)-\ÒûtwlI\rDu)/ü\Å@l\0@\êĞªU«ğ`\Ò_4\ï¼óN8\r\Å\ß40\Üõ\ê\Õ\Ëö=xğ`¹Ç•üp\ÇR­\ÄFzˆh¡‘¨b£²\é ñ\äÅ‰\'ª$5¢#F\ÒEn 6\0±\ØH\'¹Q«R\0±\0©L\ãÆÃƒÉ²RJš\n6Zl\è¹\É\áÃ‡\ÃıÆk·=ú\è£zÛ¶mO\ï	±‘\ÚbCh•r-4QlTµ\ÆE,¹ñ\ï|§\ÊR£º\ï±ˆ\r\Zb#q\å\Æ ¤ 6\0\0ª0yôh\ÙSª9r$f´†“/¾ø¢\í÷é§Ÿ†û©†GEøúë¯«=°\åş5ñ›\ê§ÄŠ\ĞHT±Q\İ‰Xr£:R#Zn¤z\Í\r\Ä 6\éÀ­ú\Ã× §t-Õ´\à\ê\0ˆ\r\0HU±QŸ|òIDT…?\ÚÃµ™3gF]°`A­¼\ÄFr¶ò„F\"¶+¯¼²Z¿cJ?‰\Ô\Ğs­¯z_:Ö–-[\0ˆ\r\ÄF2S\"6\ZØ¢–%Ó’º\Z\áeÕ—\È\rşVıT\ÏB8µ¬\â™\ÅS\ÚZf\ç;»\ã\Úbƒƒ\×F¿^tqN\0\Ä\0¤S\Ä\Æ+¯¼–±\"7\Ü:ÿ£?=%]\"6n¸\ás\Ûm·•Ù§  À\Ö4ñ¯û\Å/~a\î¼óÎ¸û\èo‡f¡‰¾<\ï¼ó\âöù\å—#+•(RQ&OlZ´h‘4UŒ b±ˆ\r\Zb£\ÂbÃ\nm\Æ*†)4›ˆŠ}ºÈ‹\â)Qƒ\İ%24;I„\Ä\È	\Ş\ß;\î³*¨©™F¸J\0b\0R\Ê\Ô\Øhß¾}¸\ï[o½eşö·¿•™šÒ¥K—\n¿d¯±\n…\Â\Ë?úÑ\Ì\Í7\ß!-ZTJ:hP\ê_w\î¹çš»\îº+\æñ%´¦\Îõ¯— 8ÿüó#ú]~ù\åv½ú¿ú\ê«öq\åÊ•öq\êÔ©	U<t\âÄ‰>\ÔØ¨½÷ƒ\Ø\0\Ä\r±‘$bCÓšf\ç—*2£¬ı:\å\Ûi–\Íf’jb£;r#KEhÉ¿\ŞEvh\êT	\ÉÿL$\0ˆ\r\0Hf*:+Š¤‡\ë×½{wsò\äI»®I“&q\ÅÆ¨Q£*ü>’}V]\×Gm—/¾øbó›\ßü&b›¦³u\Ï?ø\à\ÛÖ¯_oE\ÅYgeE\Ä\ÙgŸm.½ôÒ°”Œpûh*^µ\è\×U_Eˆt\í\Ú\Õ\Ö@‰~OË—/·²C¯w\Ùe—\Ùşz]m3fL\ÂL÷ª÷\å‰Fe#$˜±	‚*#ºõş0œ@lDŠ\rEYd\ç_RD…¦B•\èoº¢cnğaMjû\rš}Añô¨¡+$*:\æ\Ú\Û(ÁÁk½õ-\Õ\ìqòB½\ìşy¡»c¥§\0 6\0 ™y\ì±\ÇÂƒI\rœ\ã1}útÛ§yó\æ‘*\Z/jCQ\nE¯\íö\Ó{JF±\á\äE,±\á¤\Äö\í\Û\Ã}õ¨\Z$zÜ¼y³ù\îw¿k~·\ÒUü\Ç\Ğq/^l\î½÷^›’\"YÑ§O\éÑ¯_?{õ•ùè£Ì„	\ÌgŸ}f&Mšd£:\æÌ™>/ş“Dş¥¨$\"”ˆ\'5œ¼(o{<$\ÎN?ıô´‘\Zˆ\r¨fÏ½»¨¨ m\çÎoyV#6¾\ÙyÁ6ò\"/ø’·\ZúAÇœ\àJ?q}uQ,=Š\ëi(µ\ÄEft\Î	şß·ı\r•\ÒRr\Ü\ÜŞ½{Ÿ®\ãë‘« 6\0 •1bDX(ô\ï\ß?n¿\ç{\ÎöÑ€Øjh\è?í±¦€UAEQÚŠ\Û÷õ\×_OJ±‘m£!.º\è\"sıõ\×\Ûe\áşix\àÀ+şğ‡?˜)S¦„÷u©\"š7Zl(²BRC³‰8q/EM\ãOú“İ¦\çŸ\ŞÌ›7\ÏŒuœDJEI6Ê‹˜¨¨´¨¬\ÜpR¥[·niu}Bl@µ	ƒwÍœ9ó‹\Ï?ÿü+DBbEjHj\ä\ç\çoõÚŸ1+8O\ÑND„\Å\à\àµş‚Ÿn›·nTI\Ñ\ĞÁ\ÅD\Z’ÿ®Ÿ·®o´\Ä\Ğ:®€\Ø\0€Tc\ãÆa¡ ´’C‡•ê£´ı}Ğ A1ñ\Ş{ï•’\ZJ¨(şú\Zj»v\íJ*±±c\Ç³gÏğó\èˆ\rIÿ­[·š\áÃ‡\Û¥Š\èo‚\Ö\éQ\é\"Š°Ğ²Ä\ÖÏš5\Ë\Ö\Şpõ7‰¡ô•XbC\ï\Ãõ•LQS$ˆ‹ö¹êª«µ¹QYYQ\Ñş\é*5Pcx\ç;¼‹\ÏB¥<\è\"”¬Móe\ëd2ÿ¾¦s±\Z©QLf\ã&\Æ_OC\Ñs‚\ÏûûH|„\ÅFN\à\ÑNƒò®ˆ+>¼¾róo\ì”x=Rb|[|\Ô\Ö\í\È\İ-ùÁ\'ˆ\r\0HEüu6”\nÍªU«L»v\íÌ—_~s\Íhò\ĞCEÌ†R™¨‹^x!üúŠz¨*õ%6”ö¡\ëº\ÒLâ¥¢4j\Ô(¢¨š†{®b£®À¨ÿû\ß÷\×\ã¯~õ+\Ûü\Ç\\ºtiÌˆ\r\ÕJQkPR<TQ5’$zş³Ÿı\Ì\ìÛ·±Q‘\Ñi!ª\rÓ ’\é%±\äF›6m*!‚\Ø\0H¯ÿ\êO\ÑÊ›nº\éL>Ô‹\Øğ?\Ï\Î\Ş\Ğ1/”\İ\ï\áœ\à¯U+ã‘¼Ğ¥\Ù9¡\ç_#	\"i\Ñ!w\Ú\ßKt¨˜¨$Hvn »sNşÿ*mEÒ¤¸\ÎFğm\×\Ì)šA…O\0Jø\ÓQ$0¢§}\Õ(’e\á\ê7¸¦Za\çÎHİlbCQº®Ç‹\ØĞ¶fÍš…Ÿ;± h\rEch{NNN©\Ôh±QV*Š\ç\å\å…gcqD.5F\ç±Q}¹\á/(\ê—•)\Zo¿t™\Ò±P222®óşH(ù\ïÁ­|\"©-6:\å\Û!7ÿ²\è~ª³\áRK$3$2:\æûe\ç^\Ñl(sµ½ó\ĞY¹šš¶c^ğJsQdGvnpX¬\0\Ä\0$;\Zp6m\Ú4,\Ş}÷İˆ\í‘\r\ß|óyüñ\Ç\Ã_}õU…^û©§\n¿nÛ¶m«õs\Ôg\Ä\ÆgœQ!±¡Ÿz~\Î9\ç\ØÂ¡\Ñ\ÅEıûHz¸\çš\ÂõŠ+®(õÚŠúPT†{^XXh÷U:Oƒ’YQTdT\ËJ;r\Ç\ÖL*ˆ\ê–\")¡ˆ‹\ÊN\á\Z½_´4Al\0 6&ùş{°O$µ\Å\0b\0 úQŠ Ø²eKx›jlT¥?h	Š0mÚ´ˆ(\rô“Ql(\å\Úk¯µ\é&JGğ7II7ltñO\'\Zy\ášú\Õ\ß\ç\Â/´G\İs¥–\è˜\êëŠŠªIh¸H\'6ô\è¯\â\Ò_zõ\ê…Ø¨¹Q‘ \é6û	b \ìA\ï\Õ.ZÃµŒŒŒ;ød\0ˆ\r\0€\Òh€\ì\î™:w\î\\©YMš\ã7\Ş(·ŸRWü)(J¨.õ9+J}5Wƒ#YZ*Šš”5-I\0©1\ècNõ…\Ô\Ú@l\0 6\0\0J£8üÓ¶ö\ë\×\Ï­»w\ï¶	\åI\rÍ²RC\Ó]l$[KU±\á\"-ª“>Bú	b B\Ñ\Z¾)\È\î\æBl\0 6\0\0J£B˜şû&\ÕÀP±ËšB\é\'şHÖ­[› 6)%7*qA¡P\Ä@¼\ï±¤FI›\Ç\'„\Ø\0@l\0\0\Ä\æ\Í7ßŒ¸wRt\Åüùó«uL\Í~¢šş\ãÖ¤\Ô@l 6…Ê¦“~‚\Ø\0¨t´µ6\0ˆ\r\0€òQñIZŠZÿşım\ĞÊ°m\Û6ó\Â/DDi¸ô“š”\Zˆ\r\ÄF2\Ê\r€U¿nİºq\ÑAl\0”\Z\ìN)Kj0C\nb\0±\0P>K–,17.uÕ¡C\ÕQPP`gOqu8ô(‘¡\èM_Úµk×˜÷a5Q(±\ØHtÊ«™\áf?Aj 6\0\0s^9¯€\Ø\0\0¨EU¡ÿ:GGoT¥µmÛ¶\ÚSº\"6©¹Aú	b€0p^±\0P\ÇlÜ¸±TŒŠ6¥Ì›7¯\Ö\ß#b±‘r©\Ø\0`\0œW@l\0\0\Ô#G±õ7zô\èa‹F§ª\èùı÷\ßo{\ì13r\äH³k×®:{oˆ\r\ÄF¢Ë+¯¼©\Ø\0¨\Ûp\ïŞ½O¯‰\×nóÒ”¿«økûg±ˆ\r\0\0@l 6R\Õ\ÔĞ½+Sº\"6\0jm\0œ=$ÿúN¹¡[:	İ‘jRÜ‚\Ã\Ú\r\rı Z<d\ç„zô\î:\Ó\î7hö¯\í˜øpN\èòX\Ç\î˜škı#Cw\Ê	\İ\Z\Ñ77\ØO\Ç\î88ÿG5%V\0ˆ\r\0\0\Ä\r±Qÿ\è\Ş\0µ2\0î”›£kóB\Ùy¡^\îyvN\àQŸ \È\è”ø}§¼@\Û\ì\Ü\à‰Œ\ì¼\àK\ÑQ††~‘È”(Qõ	/\çšF¾v¨oç¡³.’\àPŸ\ì\Ü\Ğ{V°\ä…Zuz>p!g.\â2\Û\r 6\0\0\0±\Ø@l 6\0\Ñôú^\ç!ù—HPH^tœÿ+»\\ò\èúuÈö÷’ó‚T´…¢*:\æ\Z–Šş\È\İ\İ)7ø[-w\Î	şŸš•9¡[\İrqôGqÔ‡\íç½¾š¢Aôº^»†³V\ê^\íµe‰ŒŒŒ;ø¤\0±\0€Ø !6ˆ\r€´\Å\Ò!ø\Ò\È	¼^­º%;\'\Ø9,+…®(‰¸xTQs\í³sÙŠ¬\è˜\êªöà°‚óld‡·¬(¥©x\Ç\è\Ş!7ÿ²’\å\Î\r\Éÿ\ÇpT‡÷ü\áœà¯•şRüz¦ò-‹—C=$R8s¥\Î\ãeˆy7\İtÓ™|J€\Ø\0\0@l\Ğˆ\r\Ä@Z‰\r[\ë\"/\ØNòA©!¶nÆ\ĞşèŠ°\à\È	vW\í‰ğ²/]\ÅJ‹\Ü\à³\áş¹Á!±–KÓ£„ˆDIqºJ\è\Õ\ëğGs@©¨˜b#33ón>!@l\0\0¤/@\0y€\Ø@l 6\0\ÒSld\ç\ïqb¡cNğb¹\ì\×!wöù®M±E#%<²ó‚7(-\ÅFh\äŸ÷Ob\ÂFhøD‰•%\Ş1#û…º\ÚÇ¼@C-;±\Ñ)7Ø‡3Væ¹ŒUkc!\Ñ\Z€\Ø\0\0Ho\n\n\nLQQ!A[aa¡•Oˆ\r@l\0Ô°Ø¼p…;‹‹w^qi!sòÿ\×…ñ[WXÔ¦ ^«>š\ÊU\ÅDı\Çôï—\Ìu\ËJ;‰ˆ\ì\È	¼nkz\ä…Z)j\ä[À+7j\ãµ5\0±\0\0~6n\ÜhfÎœi>ÿüsDB‚Ju\ë\Ö!6\0±PnZUEaø\ÓO\É]ªG›*’ücñT¯Á\î¶phn }±\Äø¶8h4VV\ä2cm³58rƒ\ï\Û\×\Í	Ë\çJvp\Æ\Ê&##c\Ñ\Z€\Ø\0\0€Xr#Ú”‡Thº\×I…Ÿ©\Ø@l\0Ô’Ø°\Ñ\Ï.§Š\Îÿ•d†{®\ÙMô¨‚Ÿ’JQ\ÑO\r#7\Ô$^‘OÉ²f7Q´‡•y–\Å¡\ËU\ÄÔŸq\Å\Æu¾\Ú\Z·ò‰\0b\0\0\ç±¶´\ç\Ô\Ö\Ú Z\0\0À@8Ÿˆ\r\0\Ä$\ã9½šó\nˆ\r\0\0` œO\Ä\0b#½FRgnÚ´iüüùóO)\×1UòO“½\å\ç\ç›Ù³g\ïõZ\ßR\Ä\0\0\0a\Î\' 6\0q\Ô`*´\Äl{ö\ì1³f\Í:˜ŸŸÿg¾©ˆ\r\0\0\0ÂœO\Äb\0±Ej 5ZnŸ1c\Æj¾©ˆ\r\0\0\0ÂœO\Äb\0±¥Ÿ »Í˜1\ã\ßT\Ä\0\0\0a\Î\'b±€Øˆ\ê9 ^lğ]El\0\0\00\æ|\"6\0ˆêˆ/¿\Øm6-iV\å?e›–µñ€\Ø\0\Ä\0\00\Î\'b\0±‘\Ğb\ãğf\åôf\Ù\Ô.M\ë´\rù€\Ø\0\Ä\0\00\Î\'b n¹µDlÜŠ\Ø(_ll_õ^)©\áÚUSˆ\r@l\0\0\0a\à|\"6\0\ê[¼vÀkƒJ\ï@l”=°^z&®\Ø\Ğ6\äb\0\0À@8Ÿˆ&33ó‡\Şwö/\Ïy-\äµ\íúû\Ún¯\Íóú¼\âõ½\ß[ş)ŸZ­K\r\'3±±\'\åFE\Ä\Æ\Ê½\ãŠ\rmC> 6\0±\0\0„ó‰\ØHA\Z5jtKFF\Æ$\ï\Ëz4Jd”\×NHtx­\ÅM7\İt&Ÿd­Iò\Ö#6ˆ\r@l\0\0\0a\à|\"6\Ò\ï\Ëyµ\×VRf\Äk«\ÅÁ§Zmn-G^¸\íiWs£\"bC³ \ÄÚ†|@l\0b\0\0\ç±‘\"dffö/‰¸Ë‰&Mš˜şıû›ñ\ãÇ›U«V™İ»w›£G\Úóõ\×_›¢¢\"³n\İ:3q\âDÛ¯iÓ¦±\Ç\Şq~\Â\'\\-©Q´H\ËÈŠˆõs†\ÄÚ†|@l\0b\0\0\ç±‘\ä4l\Øğ%õ3\Â2¢E‹fÌ˜1V\\T†#G˜w\ß}\×dggGÈŒŒŒ\Ş\ãM|Ú•\â–JFbT¶Zˆ};—›•õ*†\â­\Ó6\äbJŠ\ïM›6­\ë¸q\ãò½\å^Û¾s\çÎ“º–gee}ó\È#\Í\Í\Í]¬û¯ı\0±\0\0„9Ÿ€\ØH©Q\à—={ö´‘\Õ\á\äÉ“Æ»1¶¾cöÚŸù\Ô+%)\î¨\Â~‡\ÓEnTDl¨m^4º”\Ø\Ğ:\Äb\"…Æ¤I“^\ëİ»÷‰v\í\ÚY¹\"ö$¼·m\Û^µhÑ¢—ù\Ë_\Ú\ë>\0\0\0a\Î\' 6\êœ\èH\r¥œ\Ô\ä\Í\éÎ;M—.]ür\ãhFF\Æ|òµšV’6i)Ç™õs_(†\â­\Ó6\äb¬Ô¸\Ãk»sss\Íüùó+õw@\éˆ]»vµR|Ë–-Üµ\0\0\0a\Î\' 6ê’š\Zaé ›\Ù\Ú@ÿ\áSı\r\ä†÷Ú—rbR^¡Ğº>NR‹\Ãvšusò\â\Ö\Ø\Ğ6õA@ 6\ÒXhœy\àÀQ5q­ÿğ\ÃM\ëÖ­«ñ\0\0„ó‰Ø€ŠFj\\\í/ªH\ÚD…Fûõ\ë\ç—»333È™ˆ)#j*$\å#7âŠc\Ç\Ì\îõA³\â\Ã\Ç\ãJ\r\×\ÔG}‰\Ş@l¤£\Ô3f\Ìg½zõ*u\Í>q\â„=w÷\İwŸ¹ú\ê«\Í÷¾÷=÷\Ç\Ø\\z\é¥\æşû\ï·\Û\Õ\ÏÏ¡C‡¸k\0\0ÂœO@l\Ô\rKü55\ê\"7Z7¼úo¯ \è \ÎD)	\á¤\Æi^k^òX¢÷Ké‚¢±\ÄFyQ\ZDo 6 ˜÷\ß?¿C‡¥ŠD¿ù\æ›\æ¿ø…¹\æšk\ìµú­·\Ş\nÏ†%‘±p\áBó\ÜsÏ™ë®»\ÎöSÿX¨˜4\0\0\0a\Î\' 6j…F\Z\İ\âŸı¤.Ã†?ıô\Ó\èb¢?åŒ”Š¬”Qò\ÅQ	¹o¿”•±\ÄFE¢4ÊŠ\Ş@F 6Òùó\çß§¡¾\" V^deeÙˆŒ>øÀ{­\Ö,WŠº‹…\Î\ï\å—_nû}õ\ÕW\Ç\Ò~ş\ã\0\00\æ|\"6 &\ÓP¦8¹«\ê}m3p\à@¿\Üx©Q*]¤¹ù®„\ÜğK\r×š\ÅHsI©´”Xb£ªR\Ã5db#\rRP¾\çµ\İ*\î\ìw\Üq‡¹\å–[Ì={\ìºAƒ™fÍš\Ùkõ¸q\ã\â^\Ó>l÷½ıö\ÛÃ‘Nz\ÔUD \0\00\Î\'b#P]\ÍL¢/¡¦bA®6n\Ü\èOG9Ğ¢E‹H\Ó\ÓO6Ä’eÉXı‡\Ç\èŸr57*:\İ+\r±b\ã‰\è\ë²\"5$5$)Ä©S§l}aÃ†™Áƒ\Û\í~\Í\âÅ‹Í½÷\Ş[\ê\çñ\Ç·©+\0\0\0„9Ÿˆ\r\ÄF‘‘‘ñ\'4SI}¡e÷>233\ï.#º\äj\ï=OJa©qk%dE,¹QQ©Ñ :i)‰zˆ\r¨|´Æ–-[ù£(T#C\é\'.RCh\nW]Ÿ\çÌ™c8`%GŸ>}\Ì7\ß|S\êz¾ÿ~Ó¦M3s\æL›–â¯¹±j\Õ*³|ùr\îd\0\0€0\ç±Ø¨\Ñ4”\ç\êj&”²xû\í·\Ë,\"Z2k\Ë7sKŠ¦Ÿ”\'Ê“••\Zş\×\ßS‘ÈD?ˆ\ä),/’iÓ¦uUgW3C\Å@U\0T55ü¼ó\Î;’\Î\æ\àÁƒö¹Î£®¡P(¢Ÿ\";$<\\_õ\Óñ¢gK\0\0` \ÌùDl 6jRl„œPX³fM½\Ôùó\çû#6f\ÄH»–‚R£¢\é ñ\ä\Æ\éU”\Z\å¥Á$\Õy@l$¯\ØHqy™°>üc¯…¯\Å:?W\\qE©kô“O>iºw\ï~®H\r­\Ó4¯Nvø%u—.]\Â\ë4[J´(\0\0` \ÌùDl 6jRllwƒÔºœ\r%\ZU\Ê÷\r˜wgdd\\§ÿ\ÚF¤SLlTµ\ÆE,¹±¶\ZR#\îûI¶ó€\ØH>±‘ò2¡y\î¹ç¾Xv´o\ß\Şô\í\Û7\âú¬iZ7nl§yİ°aƒ	ƒvıö\í\Ûmm¦¡C‡\Ú\çJ1Q¤†\Î\ßÈ‘#\Ãûk*X	ÿõ>Ş”°\0\0À@8Ÿˆ\r¨Š\Ø$ü\Õ\ë\ë\Z…AG\ršc¤Sh\ĞS\İYIbÉ\êH¹ñ/ÿò/b\r6´ši\"/±c\ÇT\Í\Ç\ÕW_m\n\n\n\"®ÏŸ|ò‰=\'šû\á‡6<ğ@x*W\Ém\Ó>ª«¡¢¢z¾`Á‚ğş*ªš©öGt\0\0\0a\à|\"6 \Æ\ÄF\"ü\"¤Só>şA\Õ<}§Çˆ\ÔX[²¾:\è}™{\î¹\')?W\äAb7ı§>¥Yª\â]z#Š_œyæ™¥$÷+¯¼bZ¶lirssmD†šRNœ”vÅŸ\ÕgÈ!v»›ME¨¾FñK£\ã7mÚ”»\0\0` \ÌùDl@jGl4j\Ô\è\ïq^\ZDl\ÜZ\ÅıËŠ\ØQİˆ\r÷¾’\í<\ÔW\ÄÆ¾}û\ìg¯ÿ|\ë÷HS]j¿©\Èbô~\Ú\ç\ÙgŸ5………\á\çıúõ+÷õ&Mšd.¸\à‚¸\Û?û\ì3³t\éÒ˜¯7fÌ˜z\é&0“¡EÿFQ\ZÍš5³}%¦”z¢\çú^‹+V\Øms\çÎµi,]»vù‡›\0\0` \Ìù\ÄFZ\Õ\Øp\ï/33óV\ïyA\n\×\Ø8\\K56ª\"7\â\ÖüH–óPŸ©(gœq†¹ñ\Æ­\Ø\Ğ9\Ü\Ğ\ãÀ\Ã\â\Ãõ=\çœs¬|ĞºY³f™)S¦˜•+W\Ú\ç\n\áW¡E-kºM·\Ïúõ\ë\ÃË“\'O6_|qø¹\Ò\0bIk\êÔ©vª}´\î\ÕW_5&L°\ËN¨\ÔG*J\Z\ÈË¤ \îóOõ\Z±¡¿\îœ<şø\ãF}÷\î\İk#.†\r\î§4	j­5jT\Äõˆ\r\0\0` \Ìù\ÄFm‹„\ÅQ2*H\áYQ*\Z¹oJ\×X³¢TFnT¨\æG¢Ÿ‡ú®±¡\Ù!œT=z´}¼\á†\Ü`>\ÜO\"#\'\'Ç®{\íµ\×ì£Š3;6¼¿Bı£E\ÅUW]eEÏ=\Íy\çgzô\èÑ‘N„hyù\å—GˆúŒÜˆ.š\âò2\áyğÁû¥vt\éÓ§\ÛóÑ¼yóù­\È\r¥œlÙ²%¼nÕªU¶\ï¢E‹\"®\ï\Ô\Ø\0\0\0ÂœO@lÔ¶\Ø\Ès‰ñ\ã\Ç\×\ÛI\Õkû5yñ\Şo\É h^Š†ŠÎOjœV\ÆöŠÈ«½¶§2‘#‰z\êCl(ªbÎœ9öóV$„“.\"C‘’†~±\á\ä„_€(ºBJ÷\\5\n¢Å†“\Ñşmz]\'1´¬\ã¸\æ^\Ï-k\0š(Ó½¦°¼LhüñJ[rDÏŠ¢Mt>”J\åG\ÅCU,ôé§Ÿ¸Kvh?Ñ³¢\èõ\r\Z\Ä\İ\0@š¡\â\Ó\å¥GJ¤\ç±•Æ»	\Ír_¼şıû\×\ÛI\Õ\ï|¿N\ÃSQ^\ÄDyR£A\å†K‡¹;>\ÄúŒ\Ø\Ğg­\Ún9//\Ï\Ü{\ï½6\rä£>Š[·n5Ã‡·ë®¹\æšğ~Š²Ğº\Ûo¿=\æñËŠ\Øp5<¡\áúk\0©TI@ nŠ\ÚĞ£¦\ëL±‘\âò2añ®û£ıS¯\êü\\q\ÅvYi\'*\ZOB¸h%K–\Ø\ç½zõ2İ»w/\Õ\ïºë®³\éUÿ¿½»’²¾ó\î]™\Ë\ÖU\êvS§•¤’«lö¬+\ËJ¥¬º\ä\ÌU\Î]Re]é•»±®=\ÃHDaI+\ã! K‘]\\…•˜7Œ\â+Pj†™A2Š\ï‚Ê‹€‚Šò\â(¨\Ïõ\ïaö™7˜‘yk\çó©úW÷t?\Ó\İÌ¿{˜şö\ïÿûG•G,]`pYµj\Õ	\ß\ßw\ß}~P\æS°A÷UUU}¥ø¤k\'^ñ|r\àÀ>Ÿ\Ğ6ı5š‹olN¤\Ó\ÑY\åFWC\î†\Ùı]ôiù¤`#F:´­\Ø8\í´\Ó\Ò\Ş\ZqÙ«¯¾šö\çˆ\ç¼ù‹\ëÇŸ^\áCw+6ò—\Å\'\è\Ùùs\Î9§U¯\ì±´`ƒ¾5aÂ„ÿq\Ï=÷”šjD?Œ3\Î8#}.nÜ¸1}.:t¨\Ã\ß\İ|L<9¹\âŠ+\Ò\n\Ø\êõ;\îhuL\Ìw\Ü^\Ü.\0Œ3¦\Ó7Á#GLÿVÀ|\n6ø¤\ËQJ}6/^\Ü\ç:şüü‹`AOü›fÌ˜ñ\ï{\âv.¿u\Ù\ìú}\Ş÷z¨r£í²Kºj/\ÜøA7*DŸ Øˆe\'¯¼òJ©F\Ö44k\Z\Ç\íŞ½;=\Ğ\"*4b\Ä–¿ıÛ¿M\Ï\Çò:¢œÿ“Tl\ä\á…’­[·¦\ç/¸\à‚VÁFG\rGƒSñ\×ğÿ\ËÿN\n\è‰M@cÇ“\ã‰şñ»{\îÜ¹\éi4\Í\ÍÄ’§\èï’¯`p;Ş§üş¿0Ÿ‚\rzl9J|:×—Û¾\îÚµ+­\É\îøğ\ág\Çcª¾i\Åÿ¬¾qÕ—²1ñ¦\ÆK\çkşaRM\Ã\ße?T\Óx^zLMcÕ±\Ñp\Ëø›?\×6x¨\×xõŒ§¦\ß·5·áœ‰5õ\×ÿx^\ã\×;ú\ÙL¬m\\\Ü\Ñ\åÿtSıW\'\Íkl\ÕğsbMÃ¬¸\í‰sW|\á$ƒ•¶[Á\æCŠ®„\Z§œ\àûºÛ°T°\Ñ\Å`\ã3ŸùL\Ú4«Æˆ*Š8¥\'ùŠü÷\ä{bd§7\ÜpC»c\ã6;\Û%ª>:º\í\Ï~ö³¥peÈ!‚\r:6ş¢8Zm‹\Õ±$*Â‰™9sföû;­\ÜQ¡q\á…¶k\"K\ã÷>\0ƒWG½¢ƒO÷Í§`ƒ“R|\Ãsjñ	øböD\\ºtiŸM\æµ\×^[z\n…%=¾&\Õ4\Ì\ì\èºI5+\Î\Í\Æ\Ä\Ú\ÆBum\ãô\ì\ë\êyõW\äŠÂ¤šúÿ=©¶~\\uMÃ¯\ã6«knm[e1\é\æ\Æ3ªk\ê+#(‰\ã\ã˜\Òùyõ#Z\ßw\ãu“o~\ì¿DÀ\ÇT\×4>˜,µ—Mº¡ş\Ë=¼,\åßµT\\tw×¶\ßwş§5\ÔÁFTMœÒ²Mkô·ˆË³& QU\Ñ6¨\ÈWvt4::¾£Û7š\Ùù¬±i\Ûe*‚\r\ÂÌ™3o{\ä‘GJ¿›#\à`\â¼ó\ÎKö\ï\ß\Ü\ß\ãQMC£‚(\Äs>û\Ş|P\Ş\Ğ\ĞP\Ú2€Á«£Oùõb0Ÿ‚\rz¼j#*(ò[øõ–\åË—\ç_\0G…B»ª‰\Zÿ¢º¦á¹‰sW|£\Ã\å\Å\ë\'ß´\â¿E@\áE—o9-­#¯YşŸ\"ôˆj¨¶ˆªŠ‰µõC\Û\Ş^ñ˜‹²j\Éó\ZşOŒ4Ä˜\×x~vşXõÇ±ªô¸\âıÇˆj¸\ß\âøVMKWwK9™e.‚\ÑK#–\ä/‹¥%§´4	\Ío÷\Z\á\Äé§ŸF#\Ñs\Ï=7İ‘\"¾ş\Å/~‘~O¶}l\Û!\ÅYgu\Ü\ÇoF\ÛV†D³\Ğøt=¾7£‚\r2C‡=cÔ¨Q\ïFÏ£|¸•±,%\ßü³#555ÉwŞ™\Îo,?‰\ß\ëùP#¶Šu¸}ñ\0ß¸q\ã|ºo>‚\ŞQ|\".Ë\Ñ®\í–}=)¶\Ç\Ì/A)q=¦\êyõs³ÊŠ¨˜ˆ £]\ÕÆ¼†û\Ó*yõw«\Öh<¯z^\Ã\ä\Òm\Ü\ØxvK\Å\Åqk\êT]S_•k\Z§\Æø\Ç[Vş\Ør’Æ©Q…‘.{™\×pÕ„šgµœŸüÃ›Vü\çRUGñ\ë\Ïkø\ï±ü\å\ØıÕ˜T[\é±óWG2ÀÂI†`\ãS\æ?øAaÌ˜1\ÍB\ä\Å\Z\Ùh\0\Z»¥\ÄV°±Œ)-b\ÉIôÙˆm_¿û\İ\ï¦\Çu´¦6ª5V®\\\é/\0R\Ñk¬?{üa>Ÿ\îO\ì¾X|2\îË”³f\ÍJ9\Ò+¡Ft\É=Q\Ã\Ğ\êÚ†ii¨P\Ûpk|=3&\Îk¸sBÍªÓ³c\Ò^µ\r\ã\ã¸X\Z’õ\ã\ÈWW|’4\\½/\"\è(\Ï-W9¶¼¤\á_K\Ç\×4\Ü\Ô\Ñù–¯o‰\ÓD\"(9¶\\¥ñ¼\è×‘¯\æ\èÁJ‹“Y>ò©^~\"\Øl\ĞsªªªFmÛ¶mQ\Û\ß\Û`\Ä\ÜEU\Ñ7¿ù\Í\ä\ÔSO-5&0cô\è\ÑiU‡\İO\0èª¬7ƒO÷Í§`ƒW(¾]û³\Ğ!z`DóÁ\ËO\ÚTj<<t\è\ĞVM>#,ˆê‡¬ùgumCMv]4ûl8ü\ß,Xˆ\Ğ\ãX¸\Ğ0+~¤\ËDÒ†¢õ\"ğ(\Ş\ŞwbYJz{ó\Zn\È\ßwY“\Ò,(IÃ’\âm¶>®qjzZ[?4\ÎgÁFg½@z0\Ü\èn\ÅÅ§¶Q¨`C°A\ï)şº¾ğĞ¡Co|\Ò~±*\æZ•\0\Ñ7lÁ‚i/¦\Ë.»,\í–\ï\Ç_Ç‡“&MJn¹\å–ti/\æT°ÁI«¬¬¼¨ø„l\Î\ïA\Ü\Ô\ÔtR“]ğ§OŸŞ¶±L»P#–š\äûi¤ı2Ú„Ù²‘/²ÆÇšw\Öÿ2[2yŞŠ\ï\æª0ş.k,š.A‰p¤xLl\å\Z\ÍDó·ÿ¾| \ËNZ/©¿#\í\éQ\ÛxYT|†\Ôÿ¬§¦»\ËI\ÅòÁ†`ƒ^[š2c\ìØ±¯=şø\ã\Íİ¨\Şk~\ä‘G\î\í…\ãw¾\Z\0ƒWô\r\Ë÷^\èêˆ†\Ôñş\ã\Ö[oõ\é/9zôÃ²ÓƒÍŸ\ç…`£6\ì¼\â“ğ`ş	\Ûôu7m‹Ftó\ç\Ïo[¥‘.?ijt²\å; tv}¶­j—_~òOµg––Š\Ô6üÃ±\rW¥Ck\êt,\Äø¸9h[iXQS_\Ù\Ñuiš†‡-o©Ÿ[\n;n¨ÿòñk‡\ß,ƒ\Åq\Ñ`z\Ş\n6ôx\Ğ}qq¬¹\ä’K\Ş|ù\å—­¿X;³ £xú\Úö\í\Û7Oo-~9rùò\åÿµøû}\í×¾ö5»Ÿ\0R±KF4\ì\î›ßF4±Oü9y‹WmI6\ï|+=Ë’\ç’W÷jwÌ‚\å/&\Ïü\éõ\ä\Ï\Å\ãşğä¶¤ş\é\ée÷=\Ø\ĞnN‡¸4¹x\Ôø\ä’qWÇ”ôtTõÌ¤²jDzıˆ1?.3ª4.?5=ıÁ¥c“soOV=·3½\Ï5/¾š\Ü×°)½¯¶\ã¦\Å\Ïvø8\ßÿhR{ÿ3\éù¦õ»œğ\Ú3‹OÊmÁL˜0!m\r\ä\âÓ¸\Ü¸i\Õ±•\äÔ©S;úu´³F¡‰j‹h\à\Ù.ğˆ\êˆ\ê¿\\Z*2w\Å7\"\ÌÈ¾\İM\â4\Z~FøKD¢\ég4ıxKcUgM>#9\Ş\î&Q\í‘>¾\ÚúKUt4~=š˜\æ—Àô¢ó[B‹ósı¾Áj6ô\îÿ#G,5o\Îı\ß¿Ó·TUU}¥ıj\0›k®¹¦\İ\ßÿñg|@\Z\ï6lØî”•5¡÷{÷\îM6oŞœ6Œ\ãFŒ\Ñ\î6bg­\ØÑO\îñõ¯&\Ëßš†´­\Úx\í­\ÃÉ¯–½~ø\á±\ë6m#©µ\à\ãÊ‹ª‹Ó€\âòŸÜ˜Ì˜sk2\ï¶eé€÷×¿˜\Îi\ã3;:œÓ‘—ÿ8=eN‡s\Z¡F\ÛğbÿÁ\æ¤ùı£É¿\ÜõD«\Ë#\ìˆP\æ\Ş›’\ë¶%ÿüÛµ\ée\ï.\Ï\nÁFŠªŠ\â´³\ÛVo|’Q(–t´¥+=Z¹1è–Ÿ6Hş‚D¢·RôZ\Èÿ\íK.\\˜¾\É\íØ™q\éÒ¥Iuuu»÷Ñ¯\î»yÉ±Ê‡\Ïmy==P !G„a\Î]O¦/n~5ù\Ç\é¿Lª.\İnN\ïxø¹ô\Øekşœüi\Ç[É’U[\Ò\ÓGx¥\İ}ı\à\Ã\äg›’…÷=\Ø\áœşô\æ\åi±ıµ¥\Ç\Õªüü\ç\Ó\Û\Øûö\á\äÑ¦W\Ò#g„!¿~\è…dù\Ç.›¹\àñô6œP|\ZW|\â]—o,\Ú\Å½:>ül?\Å^7u¨!\Øl \Ø\0 BK/½´\Õ{€iÓ¦%m·\ï®X\Ò\Øv\ã\è\Õp\Çwø¡wÓ÷>\Õ\ê\ëX\Ê1\és­‚%«7§§(<ô\ÇMÉ˜I3ÒŸù¨‰3“Q“ş9Ó—¶lO6n{3YºzKò\ì–×“U\Ï[N²|\í\Ë\ÉG}”¬|vG»û^ü\Ø\æ\äŞ†M\Åùü0ybÃ®\ä¡ß·\ÓË®ø\×tN5ş©´%–Í„½\ë\ÉV·õ›ß¿\Øj©J|\Ï\ê–\ÇPı(J‘[úoÌ‰\æŸ,U\ÙSü…SW<­-\n\Åó§ù©õI¸q\ã`5‚\r\0ô½¶•\Z±\ä¤\'û,\Å&S¦Liu÷\İwŸ|E5ÆŒ\ß<\Ş*ˆ¾±,%/‚5¢¢cÔ˜\Ë?“.¾$ù\Í]K\Ò9ğ\â¥W\ŞHşü\êşô|t<T¼­µv§\×\å=ú\ä+\É;‡\ŞOƒğŞ‘’\ÛÙlyyGiN/ÿimzz\ÍM¤\Ç\ì~\ãP\Zl\ì|\í@rÿ\Ê?•n\ë•=o\'w\Öm,Uu\ÄXø\è†R\ßÁ”¿ó[^\çö„`C°`€¾Ó¶§\Æ\É\î¤Ø™\è\ß½\Zò•\Ï>û¬	\è‚X\Æñ\ÄK»[q>ß—\âöGÖ§\Õ\Z±dÚ´\é\ÉÅ—K«4¢\Ù\ç’GÖ¤D&š}FõEˆp#B­»ö\'~øQ\é˜\Ã\ïM\ï3û¾\ß=¶¹tİ¶=ï¤#\æt\Ö\Ï\æ$—Nœ‘\\<\ê‡\É\è+\ç$w=ôÇ´’$z€Dğ’¯\ÆxğNg> ™u{SYÏ`\Úû+?Á†`Á\0}%v?i[©Ñ›¢)\å¬Y³>Ş•cøğd÷\î\İ&\â8ÿó¾´\ncî¢§Ó† \Ùò“u_KC7\Şi.\×ÇœVV[&2\æ\'s\Û\ÍiT_Ü¶|}²e\ç[\Éö\×\ŞI«5¢\ÏFœ6<½=9pøı´§Æ®}K\ß!È’–¥%ù\à#¼°\åµdú\ÏnN~pyu\Ú\Ë#\æô¡U/¦Ke¢¿F¾ÁiTfD…È‹/\ïK+N\ÂK\ÅûU±6Á‚\r\0>‘ü\î%\Ñ¡/¶ù>p\à@º›Fv¿?ù\ÉOLD\'¢*\ãº\ÛO\Ï\Ï^\Ø\Ô\êò\è§ñ\ĞÚ­\érh\ÚÁG\\6\êG?)ıl§şlA:§\ß=’†û¾—ö\ĞÈª5\Â<ö\×‡š´ª\ìÈ¼¼û\í\ä™Í¯wø\ãö\Ş\Úÿv«9r\Õ5\é(ù\ÇL\\39\"Ôˆ\Ë\â\ß\Øv‡Á \Ø06\08®xC›\ß)\ãd…v\Ç\ÓO?\İjIÊ¦M›L\È	Dõ\Ãõw¯KG\íıÏ¤\áF&ª6\" ˆ9%!—Œ»\"=\áª\äñg\íx\Õo|¯\Õ\í\Å\åMÏ¿œŒü\Ç+“GV?—ö\Öxa\ë¾d\ß\Ûï¶»\ïXª²\ç\ÍC>®\Ø¶£9ı—\ß>Vj \Z/–¿DE\É\Üûj5\"˜)\Ç\İP€`C°`€~6v\ì\Ø\Ò\Ñ\Øş³¯]ıõ¥û¿ú\ê«MH?\Ìi}}}z\ì\äÉ“»T­ı8Ì©`\è‚ø+<Ğ£¹®®\î¨gª`€ò}-²7 ±m\çŞ½{ûü1lİºµU7\Şx\Ã\Äôñœ\Şx\ãiuE|\Ï\âÅ‹Oxüš5kÌ©`\èŠU«V\í‰_\Ä„9v\í\ÚuO]]\İF\ÏTÁ\0\åkÁ‚¥7Ÿ±SI©®®.=»\ï¾\Û\Äô\áœÆ²K/½´ô=_|ñq—#=ÿüó\Ém·\İfN@W444|o\åÊ•o¿şú\ë\ï\nV¥F„\Z+V¬\Ø^\ß÷Ll\0P¾b™@_\í„r<÷\Ş{¯&¢ı4§›7onU]•\×]w]‡Ç¾õ\Ö[\É\å—_Ş¥­€Ûœ\n6€N\ß8_XWW·.–<D?c@Œ˜‹B\rÁ\0\å\ï²\Ë.+½ù\ì\ÏÆñF9{£G61}8§÷\ßiJ~\Äv±yQ\Ù1}úôô\Øw\ŞyÇœ\n6\0@°@ÿ>|x\é\Íg_\î†\ÒÖ;J#}7§±½o\Û`#¾€\ä\àÁƒ¥\ã\îº\ë®ôº+®¸Âœ\n6\0@°ÀÀ3\Û\Ü\Ü[m9r¤\Õc¡o\æôğ\á\ÃVkd\á\Æ\Ïşóô¸\Ø\Â5;.zx˜SÁ\06\0po‚=–Á7§O<ñD«ªŠ|µG6V®\\Ùª¹\è“O>iN\0 \Ø\0 ü>\İ\ïM*6úgNù\Ë_–ÂŒ*7²\Ëò§ù\å)\æT°\0‚\r\0ú•ƒ{Nô£•½\ç{’û·;\îÒ”)S¦˜SÁ\06\08\ìŠ2x\ç4Bì¸«®º*ù\àƒ\ÒËªªª:\r6~û\ÛßšSÁ\06\08®¼ò\ÊÒ›\ÏE‹õ\Û\ãˆû\ÎG<&zN}ô\Ñô˜K.¹¤UeG4\í¬jã©§2§‚\r\0l\00püú×¿.½ùœ={v¿=X\â=;\î¸\Ã\ÄôÁœÎ™3\'=¦±±±\Õ\å\ÑC#š…v´l\ì¢bN\0 \Ø\0`ÀØºuk\é\Íg,A8p\à@Ÿ?†|/†»w\ï61½<§±\ìd\äÈ‘É7\Ş\Ø\ám<ø\àƒ\íB©S§šSÁ\06\0xò=/^\Ü\ç÷?şü\ÒıWWW›>˜\Ó\r6$\ãÇO:\Ô\á÷Ç&?ü\á[\í†Òª‹Á8§‚\r\0l\0\ĞOòK\â\Ín_nûºk×®V\Í*×®]kBú`Nc”7gÍš5­ª.y\æs*\Ø\0\0Á\0\Ïûï¿ŸŒ1¢ôFt\éÒ¥}v\ß\×^{m\é~Çg2úhN»6|ô\ÑG\ÉOú\ÓR\ÅÆ»\ï¾kN\0 \Ø\0`\à\ÂŸ¶oÛ¶­\×\ïsùò\å­*|òI\ÑGs\Z=6º\"¶‹ï€Ãœ\n6\0@°À€6v\ì\Ø\Ò\ÒÉ“\'wkŒ\îŠeù\å\nµµµ&`€\Î\é\r7Ü\Üy\ç\æT°\0‚\r\0¶\íÛ··\Ú\âsÖ¬Yi\É\Ş5bG\rC\ËcN÷\ìÙ“¬_¿Şœ\n6\0@°ÀÀW__\ßj)AôKxó\Í7{\ìöc©BşSı1c\Æ$û÷\ï÷ƒ7§‚\r\0@°@Ï¸û\î»[½Oâ›ššN\ê6c§Œ\éÓ§·º]¡†9l\0\0‚\r\0z\Å<\Ğj	CŒÙ³g§\Í$»cÇ\Éüùó[}¢Ÿ-Uj˜SÁ\0 \Ø\0 \×<û\ì³\Éğ\á\Ã[½y1aÂ„´`õ\ê\Õ\éNYÏ†87½Q	°hÑ¢d\êÔ©\í¾W£Ps*\Ø\0\0\0ô™øşšk®i÷Iÿ\'\ãÆ³¥«9l\0\0‚\r\0ú\ŞÖ­[\ÛõS\è\êˆ%\nk×®õC4§‚\r\0@°@ÿ:|øpÚ«\áê«¯NE¶]\Ö_=:¹ò\Ê+“$»w\ïöC3§‚\r\0@°\0 \Ø\0\0\0\0‚\r\0l\0\0 \Ø\0\0Á\0€`\0l\0\06\0\0Á\0€`\0\0\0‚\r\0@°\0 \Ø\0\0\0\0‚\r\0l\0\0 \Ø\0\0Á\0€`\0l\0\06\0\0Á\0€`\0\0\0‚\r\0@°\0 \Ø\0\0\0\0‚\r\0l\0\0 \Ø\0\0Á\0€`\0l\0\06\0\0Á\0€`\0>½ÁFss³¿X\0\0:pô\è\Ñı‚\r\0Àş\æoş\æ\àºu\ëü\Õ\0Ğ§Ÿ~ú©\âŸL[ü\Õ\0Ô™gùó.¸\à¨?[\0\0\Ú9ú\Å/~±¾ø\'\Ól5ÀÀõ¹¢\r\ç{î¾¦¦¦ıG\Ê8\0€Af=º?*5ZBñ÷’?`€‡\Å1£\å?\î\Ä0£?GEE…Ÿƒaa\Äò“9B\r\0\0 [Z‚\r\0\0\0€ò#\Ø\0\0\0\0Ê–`\0\0\0([‚\r\0\0\0 l	6\0\0\0€²%\Ø\0\0\0\0Ê–`\0\0\0([‚\r\0\0\0 l	6\0\0\0€²%\Ø\0\0\0\0Ê–`\0\0\0([‚\r\0\0\0 l	6\0\0\0€²%\Ø\0\0\0\0Ê–`\0\0\0([‚\r\0\0\0 l	6\0\0\0€²%\Ø\0\0\0\0Ê–`\0\0\0([‚\r\0\0\0 l	6\0\0\0€²%\Ø\0\0\0\0Ê–`\0\0\0([‚\r\0\0\0 l	6\0\0\0€²%\Ø\0\0\0\0Ê–`\0\0\0([‚\r\0\0\0 l	6\0\0\0€²%\Ø\0\0\0\0Ê–`\0\0\0([‚\r\0\0\0 l	6\0\0\0€²%\Ø\0\0\0\0Ê–`\0\0\0([‚\r\0\0\0 l	6\0\0\0€²%\Ø\0\0\0\0Ê–`\0\0\0([‚\r\0\0\0 l	6\0\0\0€²%\Ø\0\0\0\0Ê–`\0\0\0([‚\r\0\0\0 l	6\0\0\0€²%\Ø\0\0\0\0Ê–`\0\0\0(\Ë\"\È8ÁX\ç\'\0\0\08\ß,£\Ç6\n…Â…~R\0\0\0À€TQQñğq‚µC†9\ÕO	\0\0\0Zª6:6*++/ò\0\0\0´Nzm¬S­\0\0\0xõ\Ú\Ğ[\0\0\0(…Ba‰j\r\0\0\0 ,\n…o\çzkœ\ï\'\0\0\0”•¬×†j\r\0\0\0 \ìd;¤øI\0\0\0À $É©/¿üò¢¦¦¦\ë\ëë“ºº:c\0Œ+V$«V­z£8.ö,\0\0€ND¨±zõ\êd\ïŞ½\Éû\ï¿o ±oß¾\ä±\Ç{gÅŠ\ß÷L\0\0€D¥†Pc@‡\ï\×\Õ\ÕmôL\0\0€\Äò\ÂÀuuuG=S\0\0 \Ñ\ÏAx0\àƒ\r\ÍP\0\0\àd‚Co\ïI^^· Ù°\â\Út\Äù¸Lğ \Ø\0\0\0€lÜ¿+Yÿ\è´\äù\ßOi5â²¸Nø \Ø\0\0\0€l\ì\Üğ`»P#¯nX&|l\0\0\0ÀÀ\r666şK§ÁF\\\'|l\0\0\0À€\r6\Ö\×\Í\è4Øˆ\ë„‚“QYYyZ¡P¨(šSÅ±³8’\Ü\ØSk‹\Çü²x\ì\è\âù¿ö\Ê\0\0@°!\Ø\èWÃ†\r;¯P(,©¨¨hndœh £8F2\äT¯b\0\0\0Á\ÆqG\ì‚\ÒY°\×	\İQQQñ\Í\âX\×\Í0£³±1ª8¼’\0\0-kn\ê4Øˆ\ë„‚®ª¬¬œ\İRqQ\n\'ªªª’Ù³g\'‹-J6lØ\ìÙ³\'innNÂ‘#G’½{÷&›7oN/^œ7bÄˆ‡‹·ó¯h\0\0\0ÁF»ñ\æ®’õ˜\Ş~Jñ²¸Nø \Ø8‘¡C‡~®¥F)Œ9rd²p\á\Â4¸\èÃ‡\'K—.Mª««[……BañtˆW5\0\0€`£\İx\å©\Û\Ûq™\àA°\Ñ\ÅPcu>„˜6mZZ™q2>ø\àƒdùò\åi\ÅG\î¶\Ç÷½²\0\0÷\ŞK¶<>¿ı2”\âeqğA°q<m+5b\ÉI„=e×®]É”)Sò\áFs¡P¸Ğ«\0\0@°‘Ü¿+Ù¼¦¶\Óq]#€lt¤¥§F)thjjJzCô\äˆşùÊ\â}Ÿ\é\0\00Xƒ÷\ŞKöliH^|ä§†\ZÙˆc\âX\Õ‚¼–\İO\æ+5zS4\Z5kV>\Ü\ØSYYyšW9\0\0À 6NT¥¡zC°\Ñ…B\á\Ù|O\\~Ò™$cÆŒ\É7½Ñ«\0\0`]©\Ò8^õ†0B°1lØ°óò»Ÿœl£\Ğ\îxú\é§\Û6ık¯t\0\0€Al|\ÒP#\ÂÁFEEÅ²,\\ˆ-]û\Úõ\×_Ÿ7\æx¥\0\0¢`\ÃlœŒ\èk;“D¨[±\îİ»·Ïƒ­[·æ—£\ì9r\ä_yµ\0\06Á\Æ	\n…Š,TˆJúKuuu)Ü¨¬¬¼È«\0\0@°aò`£²²²®8ş\×ñ‰¥}µ\Êñ\Ü{ï½šˆ\0\06ÁF«\Ğ\"«€¨+\n\ß\î\ä˜\Æ\ì¸M›6õ[°\Ñ\ÔÔ”¯Ø¨ój\0\0l‚¤\Íx¸mGñ²\Ùõ}¹J[;v\ì\È?\Î=^\í\0\0\0‚\rC°‘t4òKTò—777÷[°q\äÈ‘VÑ«\0\0@°a6’Œ‡ó_÷7Á\0\0€`£WGñ!$¿ø\Å/J\ç§Nz\Ü\ã_y\å•ô¸;w¦§7\ß|szyl\ïy¢ûºë®»’\ÓO?½\Ó\ëŸ{\î¹V_>|8½Õ«W÷\ëÏ¨aÂ€*6\0\0\0ø\Ô/¼ğB)Dˆ]4:;ö©§JùÕ¯~Uú\Şúúúô4Fv\Ük¯½–\ŞÎ—¾ô¥d\áÂ…\éuqYö½¿ù\Ío\Òó\Ñ\Ø2û±‹F\\¾ÿşô\ëƒ¦_ÿ\îw¿S±\Ñ\â8!ÆºB¡p\á!CN\Õc\0\0€O}°Á3\Ï<S\n6\"T8ó\Ì3“\ßÿş÷É–-[\Ò`\"®Û¾}{ú©ÿ\ÙgŸ^—\Åõ?üpzş‚.HC‘¸Í¸½¶÷±dÉ’\Òù¬º#»\İ,À\ÈF\ÜOö¸\â\ëw\Şy\ç„a‹`\ã\ã@#wŒ]Q\0\0\0øôh\Ä\éúõ\ë\Ó\Óxš_’…8\ä¿/ª0²ócÇMv\ïŞ¼úê«­ª6\Ş|ó\ÍÒ’•1b	\Ê9çœ“¼ô\ÒK¥jüñ1\âº,$É–·\Ä1<ğ€`£}°±¶²²ò¢| ‘;¦6;.B¡ş÷{¼µ^\í\0\0\0‚^	6\â1D‹,hhy#\ß\î{²ğ\"**b™Hr|şóŸO†\r–466–ıË¿ü\Ë\äk_ûZZ	ò…/|!\r\'¾ño”–—D’\İG\ÜN„(ñõ¬Y³J·\ßsJ®‚C°‘†\í*4Úª¬¬¼8fÏ\İoÁÆ”)SòÁ\Æ÷½\Ú\0\0½l\Ô\ÖÖ–.Ëª$²\Ëò#[~ù;\ßùN2jÔ¨R¬\ïF¾7F\ßs\î¹\ç¦ÁE Ë–-K¯Ë–µ´}Lù\ÛÉ‹\ïlt]UU\ÕW***š#P(O8\Ğ\ßı5š+++Oój\0\0lôh°1s\æ\Ìô4Û$–L›6­´„¤£`\ã3ŸùL\éûÿş\ïÿ¾\İò”Y\ï}\ï{\é\é!C\ÒÊ6¢\è)-\Ë\\:\n6¢:cÍš5¥\êl\é\ÊşğÁF7\äûl,^¼¸Ïƒùó\ççƒ^\é\0\0\0‚8daB~×‘S\Ú\ìpr¼`#\ßk#\Û26ì·¾õ­\äö\Ûo/\í‚JGKQò÷KX¢\n$ú3œq\Æ\éå±”%ª>0&0#\0\0IDAT]—_2~üø>\İöu×®]i¥HvÿÃ‡?\Û+\0\0@°\Ñk•Ù®#qş±\Ç+Umd•ùY0¡ETWD(r\Úi§µÛ¹$úcDC³\å-±\åë‰‚Ø™%ª3>û\ÙÏ¶»î¬³\ÎltQË¶¯/f\á\ÂÒ¥Kû,Ø¸ö\ÚkK¡F¡PX\âU\0\0 \Ø\è\Õ`cõ\ê\ÕiaCvy¶T$\ëµ!F„_ı\êWK»¥dcß¾}é±±óIvY~+\×SZzed;®DE¿şõ¯·ºø5\Ú*ùÆ¥±¤E°\Ñ5ùª¨ Ø¶m[¯‡\ZË—/\Ï/A9Z(¾\îU\0\0 \Ø\è\×aD~\Ë\×Á6\Ê5\ØË² aò\ä\É\é\\ö–è’_‚R\ã¼\Â\0\0†`\ã:t\è+**öeaCl§{\äÈ‘^	5F©a(\0\0€`\Ãlô¬B¡ğ\í\âØŸ…\Ñ#vÀ\é\É\å\'m*5:t\èç¼º\0\0†`£GTVV^TQQÑœ…Q]\Ñ\Ô\ÔtÒ»ŸLŸ>=h5\0\0\0†`£w6ì¼ŠŠŠƒù bö\ì\ÙÉ¦M›ºh\ìØ±#™?~\Û*tù‰P\0\0@°a6zMee\å™;\ÛÉ„	’»\ï¾;\İ!\'vO\Éúp\ÄiQ\İ»\âL:µm˜‘\î~¢Q(\0\0€`\Ãlô‰¨ª¨¬¬œİ¶zã“ŒB¡°Ä–®\0\0\0‚\rC°\Ñçªªª¾RQQq]¾±hGô\êX0|øğ³½‚\0\0\ÂÁF¿\Z9r\ä_´ôß˜\Í?;Xª²§²²²®xZ[(*Š\çOó\Ê\0\0@°!\Ø\0\0\0\0Á†!\Ø\0\0\0\0Á†!\Ø\0\0\0\0Á†`\0\0\0†`\0\0\0²úúz\áÁÀ\ÍuuuG=S\0\0 «V­Ú³w\ï^\Â\0»víº§®®n£g*\0\0\0t ¡¡\á{+W®|ûõ\×_W0°*5\"\ÔX±b\Åö\âø¾g*\0\0\0t¢ø\ÆùÂºººu±\ä!ú9b\Ä\\lj\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Ğ\ëş?¼©rv,½¨\Ú\0\0\0\0IEND®B`‚',1);
/*!40000 ALTER TABLE `act_ge_bytearray` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ge_property`
--

DROP TABLE IF EXISTS `act_ge_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ge_property`
--

LOCK TABLES `act_ge_property` WRITE;
/*!40000 ALTER TABLE `act_ge_property` DISABLE KEYS */;
INSERT INTO `act_ge_property` VALUES ('next.dbid','15001',7),('schema.history','create(5.18.0.0)',1),('schema.version','5.18.0.0',1);
/*!40000 ALTER TABLE `act_ge_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_actinst`
--

DROP TABLE IF EXISTS `act_hi_actinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_actinst`
--

LOCK TABLES `act_hi_actinst` WRITE;
/*!40000 ALTER TABLE `act_hi_actinst` DISABLE KEYS */;
INSERT INTO `act_hi_actinst` VALUES ('10004','leave:1:6','10001','10001','startevent1',NULL,NULL,'Start','startEvent',NULL,'2016-11-02 09:38:16.403','2016-11-02 09:38:16.410',7,''),('10006','leave:1:6','10001','10001','deptleaderaudit','10007',NULL,'éƒ¨é—¨é¢†å¯¼å®¡æ‰¹','userTask','xiaomi','2016-11-02 09:38:16.410','2016-11-02 09:46:07.006',470596,''),('11','purchase:1:7','8','8','startevent1',NULL,NULL,'Start','startEvent',NULL,'2016-11-02 08:31:44.512','2016-11-02 08:31:44.516',4,''),('12502','leave:1:6','10001','10001','exclusivegateway1',NULL,NULL,'Exclusive Gateway','exclusiveGateway',NULL,'2016-11-02 09:46:07.007','2016-11-02 09:46:07.008',1,''),('12503','leave:1:6','10001','10001','hraudit','12504',NULL,'äººäº‹å®¡æ‰¹','userTask',NULL,'2016-11-02 09:46:07.008',NULL,NULL,''),('12509','purchase:1:7','12506','12506','startevent1',NULL,NULL,'Start','startEvent',NULL,'2016-11-02 09:47:42.238','2016-11-02 09:47:42.238',0,''),('12511','purchase:1:7','12506','12506','purchaseAuditi','12512',NULL,'é‡‡è´­ç»ç†å®¡æ‰¹','userTask','xiaomi','2016-11-02 09:47:42.238','2016-11-02 09:47:50.595',8357,''),('12515','purchase:1:7','12506','12506','exclusivegateway1',NULL,NULL,'Exclusive Gateway','exclusiveGateway',NULL,'2016-11-02 09:47:50.595','2016-11-02 09:47:50.595',0,''),('12517','purchase:1:7','12506','12516','pay',NULL,NULL,'ä»˜è´¹å­æµç¨‹','subProcess',NULL,'2016-11-02 09:47:50.596',NULL,NULL,''),('12518','purchase:1:7','12506','12516','financeaudit','12519',NULL,'è´¢åŠ¡å®¡æ‰¹','userTask','xiaomi','2016-11-02 09:47:50.596','2016-11-02 09:47:57.472',6876,''),('12523','purchase:1:7','12506','12516','exclusivegateway3',NULL,NULL,'Exclusive Gateway','exclusiveGateway',NULL,'2016-11-02 09:47:57.472','2016-11-02 09:47:57.472',0,''),('12524','purchase:1:7','12506','12516','exclusivegateway4',NULL,NULL,'Exclusive Gateway','exclusiveGateway',NULL,'2016-11-02 09:47:57.472','2016-11-02 09:47:57.472',0,''),('12525','purchase:1:7','12506','12516','manageraudit','12526',NULL,'æ€»ç»ç†å®¡æ‰¹','userTask',NULL,'2016-11-02 09:47:57.472',NULL,NULL,''),('12531','purchase:1:7','12528','12528','startevent1',NULL,NULL,'Start','startEvent',NULL,'2016-11-02 09:52:14.467','2016-11-02 09:52:14.467',0,''),('12533','purchase:1:7','12528','12528','purchaseAuditi','12534',NULL,'é‡‡è´­ç»ç†å®¡æ‰¹','userTask',NULL,'2016-11-02 09:52:14.467',NULL,NULL,''),('13','purchase:1:7','8','8','purchaseAuditi','14',NULL,'é‡‡è´­ç»ç†å®¡æ‰¹','userTask','xiaomi','2016-11-02 08:31:44.517','2016-11-02 08:32:05.096',20579,''),('17','purchase:1:7','8','8','exclusivegateway1',NULL,NULL,'Exclusive Gateway','exclusiveGateway',NULL,'2016-11-02 08:32:05.096','2016-11-02 08:32:05.096',0,''),('19','purchase:1:7','8','18','pay',NULL,NULL,'ä»˜è´¹å­æµç¨‹','subProcess',NULL,'2016-11-02 08:32:05.097','2016-11-02 08:32:31.959',26862,''),('20','purchase:1:7','8','18','financeaudit','21',NULL,'è´¢åŠ¡å®¡æ‰¹','userTask','xiaomi','2016-11-02 08:32:05.097','2016-11-02 08:32:31.956',26859,''),('24','purchase:1:7','8','18','exclusivegateway3',NULL,NULL,'Exclusive Gateway','exclusiveGateway',NULL,'2016-11-02 08:32:31.956','2016-11-02 08:32:31.956',0,''),('25','purchase:1:7','8','18','errorendevent2',NULL,NULL,'è´¢åŠ¡ä¸åŒæ„','endEvent',NULL,'2016-11-02 08:32:31.956',NULL,NULL,''),('2502','purchase:1:7','8','35','exclusivegateway5',NULL,NULL,'Exclusive Gateway','exclusiveGateway',NULL,'2016-11-02 08:47:22.805','2016-11-02 08:47:22.805',0,''),('2503','purchase:1:7','8','35','errorendevent1',NULL,NULL,'æ€»ç»ç†ä¸åŒæ„','endEvent',NULL,'2016-11-02 08:47:22.805',NULL,NULL,''),('2504','purchase:1:7','8','35','boundaryerror1',NULL,NULL,'Error','boundaryError',NULL,'2016-11-02 08:47:22.805','2016-11-02 08:47:22.805',0,''),('2505','purchase:1:7','8','8','updateapply','2506',NULL,'è°ƒæ•´ç”³è¯·','userTask','xiaomi','2016-11-02 08:47:22.821','2016-11-02 08:47:42.887',20066,''),('2507','purchase:1:7','8','8','exclusivegateway2',NULL,NULL,'æ˜¯å¦é‡æ–°ç”³è¯·','exclusiveGateway',NULL,'2016-11-02 08:47:42.887','2016-11-02 08:47:42.887',0,''),('2508','purchase:1:7','8','8','purchaseAuditi','2509',NULL,'é‡‡è´­ç»ç†å®¡æ‰¹','userTask','xiaomi','2016-11-02 08:47:42.887','2016-11-02 08:47:49.460',6573,''),('2511','purchase:1:7','8','8','exclusivegateway1',NULL,NULL,'Exclusive Gateway','exclusiveGateway',NULL,'2016-11-02 08:47:49.460','2016-11-02 08:47:49.460',0,''),('2513','purchase:1:7','8','2512','pay',NULL,NULL,'ä»˜è´¹å­æµç¨‹','subProcess',NULL,'2016-11-02 08:47:49.461','2016-11-02 08:55:14.336',444875,''),('2514','purchase:1:7','8','2512','financeaudit','2515',NULL,'è´¢åŠ¡å®¡æ‰¹','userTask','xiaomi','2016-11-02 08:47:49.461','2016-11-02 08:47:53.292',3831,''),('2517','purchase:1:7','8','2512','exclusivegateway3',NULL,NULL,'Exclusive Gateway','exclusiveGateway',NULL,'2016-11-02 08:47:53.293','2016-11-02 08:47:53.293',0,''),('2518','purchase:1:7','8','2512','exclusivegateway4',NULL,NULL,'Exclusive Gateway','exclusiveGateway',NULL,'2016-11-02 08:47:53.293','2016-11-02 08:47:53.293',0,''),('2519','purchase:1:7','8','2512','manageraudit','2520',NULL,'æ€»ç»ç†å®¡æ‰¹','userTask','xiaomi','2016-11-02 08:47:53.293','2016-11-02 08:47:57.461',4168,''),('2522','purchase:1:7','8','2512','exclusivegateway5',NULL,NULL,'Exclusive Gateway','exclusiveGateway',NULL,'2016-11-02 08:47:57.461','2016-11-02 08:47:57.461',0,''),('2523','purchase:1:7','8','2512','paymoney','2524',NULL,'å‡ºçº³ä»˜æ¬¾','userTask','xiaomi','2016-11-02 08:47:57.461','2016-11-02 08:55:14.330',436869,''),('26','purchase:1:7','8','18','boundaryerror1',NULL,NULL,'Error','boundaryError',NULL,'2016-11-02 08:32:31.958','2016-11-02 08:32:31.958',0,''),('27','purchase:1:7','8','8','updateapply','28',NULL,'è°ƒæ•´ç”³è¯·','userTask','xiaomi','2016-11-02 08:32:31.960','2016-11-02 08:32:49.998',18038,''),('30','purchase:1:7','8','8','exclusivegateway2',NULL,NULL,'æ˜¯å¦é‡æ–°ç”³è¯·','exclusiveGateway',NULL,'2016-11-02 08:32:49.998','2016-11-02 08:32:49.998',0,''),('31','purchase:1:7','8','8','purchaseAuditi','32',NULL,'é‡‡è´­ç»ç†å®¡æ‰¹','userTask','xiaomi','2016-11-02 08:32:49.998','2016-11-02 08:33:01.914',11916,''),('34','purchase:1:7','8','8','exclusivegateway1',NULL,NULL,'Exclusive Gateway','exclusiveGateway',NULL,'2016-11-02 08:33:01.914','2016-11-02 08:33:01.914',0,''),('36','purchase:1:7','8','35','pay',NULL,NULL,'ä»˜è´¹å­æµç¨‹','subProcess',NULL,'2016-11-02 08:33:01.914','2016-11-02 08:47:22.821',860907,''),('37','purchase:1:7','8','35','financeaudit','38',NULL,'è´¢åŠ¡å®¡æ‰¹','userTask','xiaomi','2016-11-02 08:33:01.915','2016-11-02 08:33:12.293',10378,''),('41','purchase:1:7','8','35','exclusivegateway3',NULL,NULL,'Exclusive Gateway','exclusiveGateway',NULL,'2016-11-02 08:33:12.293','2016-11-02 08:33:12.293',0,''),('42','purchase:1:7','8','35','exclusivegateway4',NULL,NULL,'Exclusive Gateway','exclusiveGateway',NULL,'2016-11-02 08:33:12.293','2016-11-02 08:33:12.293',0,''),('43','purchase:1:7','8','35','manageraudit','44',NULL,'æ€»ç»ç†å®¡æ‰¹','userTask','xiaomi','2016-11-02 08:33:12.293','2016-11-02 08:47:22.805',850512,''),('49','purchase:1:7','46','46','startevent1',NULL,NULL,'Start','startEvent',NULL,'2016-11-02 08:39:09.819','2016-11-02 08:39:09.819',0,''),('5001','purchase:1:7','8','2512','endevent2',NULL,NULL,'End','endEvent',NULL,'2016-11-02 08:55:14.334','2016-11-02 08:55:14.334',0,''),('5002','purchase:1:7','8','8','receiveitem','5003',NULL,'æ”¶è´§ç¡®è®¤','userTask','xiaomi','2016-11-02 08:55:14.338','2016-11-02 09:06:28.874',674536,''),('5004','purchase:1:7','46','56','endevent2',NULL,NULL,'End','endEvent',NULL,'2016-11-02 08:55:32.228','2016-11-02 08:55:32.228',0,''),('5005','purchase:1:7','46','46','receiveitem','5006',NULL,'æ”¶è´§ç¡®è®¤','userTask','xiaomi','2016-11-02 08:55:32.231','2016-11-02 09:06:42.011',669780,''),('51','purchase:1:7','46','46','purchaseAuditi','52',NULL,'é‡‡è´­ç»ç†å®¡æ‰¹','userTask','xiaomi','2016-11-02 08:39:09.819','2016-11-02 08:39:15.826',6007,''),('55','purchase:1:7','46','46','exclusivegateway1',NULL,NULL,'Exclusive Gateway','exclusiveGateway',NULL,'2016-11-02 08:39:15.826','2016-11-02 08:39:15.826',0,''),('57','purchase:1:7','46','56','pay',NULL,NULL,'ä»˜è´¹å­æµç¨‹','subProcess',NULL,'2016-11-02 08:39:15.842','2016-11-02 08:55:32.229',976387,''),('58','purchase:1:7','46','56','financeaudit','59',NULL,'è´¢åŠ¡å®¡æ‰¹','userTask','xiaomi','2016-11-02 08:39:15.842','2016-11-02 08:39:19.976',4134,''),('63','purchase:1:7','46','56','exclusivegateway3',NULL,NULL,'Exclusive Gateway','exclusiveGateway',NULL,'2016-11-02 08:39:19.976','2016-11-02 08:39:19.976',0,''),('64','purchase:1:7','46','56','exclusivegateway4',NULL,NULL,'Exclusive Gateway','exclusiveGateway',NULL,'2016-11-02 08:39:19.976','2016-11-02 08:39:19.976',0,''),('65','purchase:1:7','46','56','paymoney','66',NULL,'å‡ºçº³ä»˜æ¬¾','userTask','xiaomi','2016-11-02 08:39:19.976','2016-11-02 08:55:32.228',972252,''),('7501','purchase:1:7','8','8','endevent3',NULL,NULL,'End','endEvent',NULL,'2016-11-02 09:06:28.890','2016-11-02 09:06:28.890',0,''),('7502','purchase:1:7','46','46','endevent3',NULL,NULL,'End','endEvent',NULL,'2016-11-02 09:06:42.011','2016-11-02 09:06:42.011',0,'');
/*!40000 ALTER TABLE `act_hi_actinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_attachment`
--

DROP TABLE IF EXISTS `act_hi_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_attachment`
--

LOCK TABLES `act_hi_attachment` WRITE;
/*!40000 ALTER TABLE `act_hi_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_comment`
--

DROP TABLE IF EXISTS `act_hi_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_comment`
--

LOCK TABLES `act_hi_comment` WRITE;
/*!40000 ALTER TABLE `act_hi_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_detail`
--

DROP TABLE IF EXISTS `act_hi_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_detail`
--

LOCK TABLES `act_hi_detail` WRITE;
/*!40000 ALTER TABLE `act_hi_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_identitylink`
--

DROP TABLE IF EXISTS `act_hi_identitylink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_identitylink`
--

LOCK TABLES `act_hi_identitylink` WRITE;
/*!40000 ALTER TABLE `act_hi_identitylink` DISABLE KEYS */;
INSERT INTO `act_hi_identitylink` VALUES ('10',NULL,'starter','xiaomi',NULL,'8'),('10003',NULL,'starter','xiaomi',NULL,'10001'),('10008','éƒ¨é—¨ç»ç†','candidate',NULL,'10007',NULL),('12505','äººäº‹','candidate',NULL,'12504',NULL),('12508',NULL,'starter','xiaomi',NULL,'12506'),('12513','é‡‡è´­ç»ç†','candidate',NULL,'12512',NULL),('12520','è´¢åŠ¡ç®¡ç†å‘˜','candidate',NULL,'12519',NULL),('12527','æ€»ç»ç†','candidate',NULL,'12526',NULL),('12530',NULL,'starter','xiaomi',NULL,'12528'),('12535','é‡‡è´­ç»ç†','candidate',NULL,'12534',NULL),('15','é‡‡è´­ç»ç†','candidate',NULL,'14',NULL),('22','è´¢åŠ¡ç®¡ç†å‘˜','candidate',NULL,'21',NULL),('2510','é‡‡è´­ç»ç†','candidate',NULL,'2509',NULL),('2516','è´¢åŠ¡ç®¡ç†å‘˜','candidate',NULL,'2515',NULL),('2521','æ€»ç»ç†','candidate',NULL,'2520',NULL),('2525','å‡ºçº³å‘˜','candidate',NULL,'2524',NULL),('33','é‡‡è´­ç»ç†','candidate',NULL,'32',NULL),('39','è´¢åŠ¡ç®¡ç†å‘˜','candidate',NULL,'38',NULL),('45','æ€»ç»ç†','candidate',NULL,'44',NULL),('48',NULL,'starter','xiaomi',NULL,'46'),('53','é‡‡è´­ç»ç†','candidate',NULL,'52',NULL),('60','è´¢åŠ¡ç®¡ç†å‘˜','candidate',NULL,'59',NULL),('67','å‡ºçº³å‘˜','candidate',NULL,'66',NULL);
/*!40000 ALTER TABLE `act_hi_identitylink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_procinst`
--

DROP TABLE IF EXISTS `act_hi_procinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_procinst`
--

LOCK TABLES `act_hi_procinst` WRITE;
/*!40000 ALTER TABLE `act_hi_procinst` DISABLE KEYS */;
INSERT INTO `act_hi_procinst` VALUES ('10001','10001','7','leave:1:6','2016-11-02 09:38:16.403',NULL,NULL,'xiaomi','startevent1',NULL,NULL,NULL,'',NULL),('12506','12506','20','purchase:1:7','2016-11-02 09:47:42.238',NULL,NULL,'xiaomi','startevent1',NULL,NULL,NULL,'',NULL),('12528','12528','21','purchase:1:7','2016-11-02 09:52:14.467',NULL,NULL,'xiaomi','startevent1',NULL,NULL,NULL,'',NULL),('46','46','19','purchase:1:7','2016-11-02 08:39:09.819','2016-11-02 09:06:42.011',1652192,'xiaomi','startevent1','endevent3',NULL,NULL,'',NULL),('8','8','18','purchase:1:7','2016-11-02 08:31:44.512','2016-11-02 09:06:28.890',2084378,'xiaomi','startevent1','endevent3',NULL,NULL,'',NULL);
/*!40000 ALTER TABLE `act_hi_procinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_taskinst`
--

DROP TABLE IF EXISTS `act_hi_taskinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_taskinst`
--

LOCK TABLES `act_hi_taskinst` WRITE;
/*!40000 ALTER TABLE `act_hi_taskinst` DISABLE KEYS */;
INSERT INTO `act_hi_taskinst` VALUES ('10007','leave:1:6','deptleaderaudit','10001','10001','éƒ¨é—¨é¢†å¯¼å®¡æ‰¹',NULL,NULL,NULL,'xiaomi','2016-11-02 09:38:16.410','2016-11-02 09:46:06.985','2016-11-02 09:46:07.000',470590,'completed',50,NULL,NULL,NULL,''),('12504','leave:1:6','hraudit','10001','10001','äººäº‹å®¡æ‰¹',NULL,NULL,NULL,NULL,'2016-11-02 09:46:07.008',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('12512','purchase:1:7','purchaseAuditi','12506','12506','é‡‡è´­ç»ç†å®¡æ‰¹',NULL,NULL,NULL,'xiaomi','2016-11-02 09:47:42.238','2016-11-02 09:47:50.582','2016-11-02 09:47:50.593',8355,'completed',50,NULL,NULL,NULL,''),('12519','purchase:1:7','financeaudit','12506','12516','è´¢åŠ¡å®¡æ‰¹',NULL,NULL,NULL,'xiaomi','2016-11-02 09:47:50.596','2016-11-02 09:47:57.461','2016-11-02 09:47:57.471',6875,'completed',50,NULL,NULL,NULL,''),('12526','purchase:1:7','manageraudit','12506','12516','æ€»ç»ç†å®¡æ‰¹',NULL,NULL,NULL,NULL,'2016-11-02 09:47:57.472',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('12534','purchase:1:7','purchaseAuditi','12528','12528','é‡‡è´­ç»ç†å®¡æ‰¹',NULL,NULL,NULL,NULL,'2016-11-02 09:52:14.467',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('14','purchase:1:7','purchaseAuditi','8','8','é‡‡è´­ç»ç†å®¡æ‰¹',NULL,NULL,NULL,'xiaomi','2016-11-02 08:31:44.517','2016-11-02 08:32:05.083','2016-11-02 08:32:05.094',20577,'completed',50,NULL,NULL,NULL,''),('21','purchase:1:7','financeaudit','8','18','è´¢åŠ¡å®¡æ‰¹',NULL,NULL,NULL,'xiaomi','2016-11-02 08:32:05.097','2016-11-02 08:32:31.946','2016-11-02 08:32:31.954',26857,'completed',50,NULL,NULL,NULL,''),('2506','purchase:1:7','updateapply','8','8','è°ƒæ•´ç”³è¯·',NULL,NULL,NULL,'xiaomi','2016-11-02 08:47:22.821','2016-11-02 08:47:42.879','2016-11-02 08:47:42.885',20064,'completed',50,NULL,NULL,NULL,''),('2509','purchase:1:7','purchaseAuditi','8','8','é‡‡è´­ç»ç†å®¡æ‰¹',NULL,NULL,NULL,'xiaomi','2016-11-02 08:47:42.887','2016-11-02 08:47:49.449','2016-11-02 08:47:49.459',6572,'completed',50,NULL,NULL,NULL,''),('2515','purchase:1:7','financeaudit','8','2512','è´¢åŠ¡å®¡æ‰¹',NULL,NULL,NULL,'xiaomi','2016-11-02 08:47:49.461','2016-11-02 08:47:53.275','2016-11-02 08:47:53.290',3829,'completed',50,NULL,NULL,NULL,''),('2520','purchase:1:7','manageraudit','8','2512','æ€»ç»ç†å®¡æ‰¹',NULL,NULL,NULL,'xiaomi','2016-11-02 08:47:53.293','2016-11-02 08:47:57.451','2016-11-02 08:47:57.460',4167,'completed',50,NULL,NULL,NULL,''),('2524','purchase:1:7','paymoney','8','2512','å‡ºçº³ä»˜æ¬¾',NULL,NULL,NULL,'xiaomi','2016-11-02 08:47:57.461','2016-11-02 08:55:14.313','2016-11-02 08:55:14.322',436861,'completed',50,NULL,NULL,NULL,''),('28','purchase:1:7','updateapply','8','8','è°ƒæ•´ç”³è¯·',NULL,NULL,NULL,'xiaomi','2016-11-02 08:32:31.960','2016-11-02 08:32:49.988','2016-11-02 08:32:49.997',18037,'completed',50,NULL,NULL,NULL,''),('32','purchase:1:7','purchaseAuditi','8','8','é‡‡è´­ç»ç†å®¡æ‰¹',NULL,NULL,NULL,'xiaomi','2016-11-02 08:32:49.998','2016-11-02 08:33:01.904','2016-11-02 08:33:01.912',11914,'completed',50,NULL,NULL,NULL,''),('38','purchase:1:7','financeaudit','8','35','è´¢åŠ¡å®¡æ‰¹',NULL,NULL,NULL,'xiaomi','2016-11-02 08:33:01.915','2016-11-02 08:33:12.280','2016-11-02 08:33:12.292',10377,'completed',50,NULL,NULL,NULL,''),('44','purchase:1:7','manageraudit','8','35','æ€»ç»ç†å®¡æ‰¹',NULL,NULL,NULL,'xiaomi','2016-11-02 08:33:12.293','2016-11-02 08:47:22.790','2016-11-02 08:47:22.805',850512,'completed',50,NULL,NULL,NULL,''),('5003','purchase:1:7','receiveitem','8','8','æ”¶è´§ç¡®è®¤',NULL,NULL,NULL,'xiaomi','2016-11-02 08:55:14.338','2016-11-02 09:06:28.795','2016-11-02 09:06:28.874',674536,'completed',50,NULL,NULL,NULL,''),('5006','purchase:1:7','receiveitem','46','46','æ”¶è´§ç¡®è®¤',NULL,NULL,NULL,'xiaomi','2016-11-02 08:55:32.231','2016-11-02 09:06:41.995','2016-11-02 09:06:42.011',669780,'completed',50,NULL,NULL,NULL,''),('52','purchase:1:7','purchaseAuditi','46','46','é‡‡è´­ç»ç†å®¡æ‰¹',NULL,NULL,NULL,'xiaomi','2016-11-02 08:39:09.819','2016-11-02 08:39:15.826','2016-11-02 08:39:15.826',6007,'completed',50,NULL,NULL,NULL,''),('59','purchase:1:7','financeaudit','46','56','è´¢åŠ¡å®¡æ‰¹',NULL,NULL,NULL,'xiaomi','2016-11-02 08:39:15.842','2016-11-02 08:39:19.960','2016-11-02 08:39:19.976',4134,'completed',50,NULL,NULL,NULL,''),('66','purchase:1:7','paymoney','46','56','å‡ºçº³ä»˜æ¬¾',NULL,NULL,NULL,'xiaomi','2016-11-02 08:39:19.976','2016-11-02 08:55:32.219','2016-11-02 08:55:32.226',972250,'completed',50,NULL,NULL,NULL,'');
/*!40000 ALTER TABLE `act_hi_taskinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_varinst`
--

DROP TABLE IF EXISTS `act_hi_varinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_varinst`
--

LOCK TABLES `act_hi_varinst` WRITE;
/*!40000 ALTER TABLE `act_hi_varinst` DISABLE KEYS */;
INSERT INTO `act_hi_varinst` VALUES ('10002','10001','10001',NULL,'${applyuserid}','string',0,NULL,NULL,NULL,'xiaomi',NULL,'2016-11-02 09:38:16.402','2016-11-02 09:38:16.402'),('10005','10001','10001',NULL,'applyuserid','string',0,NULL,NULL,NULL,'xiaomi',NULL,'2016-11-02 09:38:16.403','2016-11-02 09:38:16.403'),('12','8','8',NULL,'starter','string',1,NULL,NULL,NULL,'xiaomi',NULL,'2016-11-02 08:31:44.512','2016-11-02 09:06:28.890'),('12501','10001','10001',NULL,'deptleaderapprove','string',0,NULL,NULL,NULL,'true',NULL,'2016-11-02 09:46:06.997','2016-11-02 09:46:06.997'),('12507','12506','12506',NULL,'${starter}','string',0,NULL,NULL,NULL,'xiaomi',NULL,'2016-11-02 09:47:42.237','2016-11-02 09:47:42.237'),('12510','12506','12506',NULL,'starter','string',0,NULL,NULL,NULL,'xiaomi',NULL,'2016-11-02 09:47:42.238','2016-11-02 09:47:42.238'),('12514','12506','12506',NULL,'purchaseauditi','string',0,NULL,NULL,NULL,'true',NULL,'2016-11-02 09:47:50.591','2016-11-02 09:47:50.591'),('12521','12506','12506',NULL,'money','string',0,NULL,NULL,NULL,'20000',NULL,'2016-11-02 09:47:57.470','2016-11-02 09:47:57.470'),('12522','12506','12506',NULL,'finance','string',0,NULL,NULL,NULL,'true',NULL,'2016-11-02 09:47:57.470','2016-11-02 09:47:57.470'),('12529','12528','12528',NULL,'${starter}','string',0,NULL,NULL,NULL,'xiaomi',NULL,'2016-11-02 09:52:14.466','2016-11-02 09:52:14.466'),('12532','12528','12528',NULL,'starter','string',0,NULL,NULL,NULL,'xiaomi',NULL,'2016-11-02 09:52:14.467','2016-11-02 09:52:14.467'),('16','8','8',NULL,'purchaseauditi','string',3,NULL,NULL,NULL,'true',NULL,'2016-11-02 08:32:05.092','2016-11-02 09:06:28.890'),('23','8','8',NULL,'finance','string',3,NULL,NULL,NULL,'true',NULL,'2016-11-02 08:32:31.953','2016-11-02 09:06:28.890'),('2501','8','8',NULL,'manager','string',2,NULL,NULL,NULL,'true',NULL,'2016-11-02 08:47:22.805','2016-11-02 09:06:28.890'),('29','8','8',NULL,'updateapply','boolean',2,NULL,NULL,1,NULL,NULL,'2016-11-02 08:32:49.994','2016-11-02 09:06:28.890'),('40','8','8',NULL,'money','string',2,NULL,NULL,NULL,'20000',NULL,'2016-11-02 08:33:12.290','2016-11-02 09:06:28.890'),('47','46','46',NULL,'${starter}','string',1,NULL,NULL,NULL,'xiaomi',NULL,'2016-11-02 08:39:09.819','2016-11-02 09:06:42.011'),('50','46','46',NULL,'starter','string',1,NULL,NULL,NULL,'xiaomi',NULL,'2016-11-02 08:39:09.819','2016-11-02 09:06:42.011'),('54','46','46',NULL,'purchaseauditi','string',1,NULL,NULL,NULL,'true',NULL,'2016-11-02 08:39:15.826','2016-11-02 09:06:42.011'),('61','46','46',NULL,'money','string',1,NULL,NULL,NULL,'9',NULL,'2016-11-02 08:39:19.960','2016-11-02 09:06:42.011'),('62','46','46',NULL,'finance','string',1,NULL,NULL,NULL,'true',NULL,'2016-11-02 08:39:19.960','2016-11-02 09:06:42.011'),('9','8','8',NULL,'${starter}','string',1,NULL,NULL,NULL,'xiaomi',NULL,'2016-11-02 08:31:44.510','2016-11-02 09:06:28.890');
/*!40000 ALTER TABLE `act_hi_varinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_group`
--

DROP TABLE IF EXISTS `act_id_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_group` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_group`
--

LOCK TABLES `act_id_group` WRITE;
/*!40000 ALTER TABLE `act_id_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_info`
--

DROP TABLE IF EXISTS `act_id_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_info`
--

LOCK TABLES `act_id_info` WRITE;
/*!40000 ALTER TABLE `act_id_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_membership`
--

DROP TABLE IF EXISTS `act_id_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_membership`
--

LOCK TABLES `act_id_membership` WRITE;
/*!40000 ALTER TABLE `act_id_membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_user`
--

DROP TABLE IF EXISTS `act_id_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_user` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_user`
--

LOCK TABLES `act_id_user` WRITE;
/*!40000 ALTER TABLE `act_id_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_deployment`
--

DROP TABLE IF EXISTS `act_re_deployment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_deployment`
--

LOCK TABLES `act_re_deployment` WRITE;
/*!40000 ALTER TABLE `act_re_deployment` DISABLE KEYS */;
INSERT INTO `act_re_deployment` VALUES ('1','SpringAutoDeployment',NULL,'','2016-11-02 00:31:12.274');
/*!40000 ALTER TABLE `act_re_deployment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_model`
--

DROP TABLE IF EXISTS `act_re_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_model`
--

LOCK TABLES `act_re_model` WRITE;
/*!40000 ALTER TABLE `act_re_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_re_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_procdef`
--

DROP TABLE IF EXISTS `act_re_procdef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_procdef`
--

LOCK TABLES `act_re_procdef` WRITE;
/*!40000 ALTER TABLE `act_re_procdef` DISABLE KEYS */;
INSERT INTO `act_re_procdef` VALUES ('leave:1:6',1,'http://www.activiti.org/test','My process','leave',1,'1','D:\\apache-tomcat-8.0.36\\webapps\\Spring-activiti\\WEB-INF\\classes\\process\\leave.bpmn','D:\\apache-tomcat-8.0.36\\webapps\\Spring-activiti\\WEB-INF\\classes\\process\\leave.leave.png',NULL,0,1,1,''),('purchase:1:7',1,'http://www.activiti.org/test','purchaseprocess','purchase',1,'1','D:\\apache-tomcat-8.0.36\\webapps\\Spring-activiti\\WEB-INF\\classes\\process\\purchase.bpmn','D:\\apache-tomcat-8.0.36\\webapps\\Spring-activiti\\WEB-INF\\classes\\process\\purchase.purchase.png',NULL,0,1,1,'');
/*!40000 ALTER TABLE `act_re_procdef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_event_subscr`
--

DROP TABLE IF EXISTS `act_ru_event_subscr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_event_subscr`
--

LOCK TABLES `act_ru_event_subscr` WRITE;
/*!40000 ALTER TABLE `act_ru_event_subscr` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_event_subscr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_execution`
--

DROP TABLE IF EXISTS `act_ru_execution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_execution`
--

LOCK TABLES `act_ru_execution` WRITE;
/*!40000 ALTER TABLE `act_ru_execution` DISABLE KEYS */;
INSERT INTO `act_ru_execution` VALUES ('10001',2,'10001','7',NULL,'leave:1:6',NULL,'hraudit',1,0,1,0,1,2,'',NULL,NULL),('12506',2,'12506','20',NULL,'purchase:1:7',NULL,NULL,0,0,1,0,1,0,'',NULL,NULL),('12516',2,'12506',NULL,'12506','purchase:1:7',NULL,'manageraudit',1,0,1,0,1,2,'',NULL,NULL),('12528',1,'12528','21',NULL,'purchase:1:7',NULL,'purchaseAuditi',1,0,1,0,1,2,'',NULL,NULL);
/*!40000 ALTER TABLE `act_ru_execution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_identitylink`
--

DROP TABLE IF EXISTS `act_ru_identitylink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_identitylink`
--

LOCK TABLES `act_ru_identitylink` WRITE;
/*!40000 ALTER TABLE `act_ru_identitylink` DISABLE KEYS */;
INSERT INTO `act_ru_identitylink` VALUES ('10003',1,NULL,'starter','xiaomi',NULL,'10001',NULL),('12505',1,'äººäº‹','candidate',NULL,'12504',NULL,NULL),('12508',1,NULL,'starter','xiaomi',NULL,'12506',NULL),('12527',1,'æ€»ç»ç†','candidate',NULL,'12526',NULL,NULL),('12530',1,NULL,'starter','xiaomi',NULL,'12528',NULL),('12535',1,'é‡‡è´­ç»ç†','candidate',NULL,'12534',NULL,NULL);
/*!40000 ALTER TABLE `act_ru_identitylink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_job`
--

DROP TABLE IF EXISTS `act_ru_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_job`
--

LOCK TABLES `act_ru_job` WRITE;
/*!40000 ALTER TABLE `act_ru_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_task`
--

DROP TABLE IF EXISTS `act_ru_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_task`
--

LOCK TABLES `act_ru_task` WRITE;
/*!40000 ALTER TABLE `act_ru_task` DISABLE KEYS */;
INSERT INTO `act_ru_task` VALUES ('12504',1,'10001','10001','leave:1:6','äººäº‹å®¡æ‰¹',NULL,NULL,'hraudit',NULL,NULL,NULL,50,'2016-11-02 01:46:07.008',NULL,NULL,1,'',NULL),('12526',1,'12516','12506','purchase:1:7','æ€»ç»ç†å®¡æ‰¹',NULL,NULL,'manageraudit',NULL,NULL,NULL,50,'2016-11-02 01:47:57.472',NULL,NULL,1,'',NULL),('12534',1,'12528','12528','purchase:1:7','é‡‡è´­ç»ç†å®¡æ‰¹',NULL,NULL,'purchaseAuditi',NULL,NULL,NULL,50,'2016-11-02 01:52:14.467',NULL,NULL,1,'',NULL);
/*!40000 ALTER TABLE `act_ru_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_variable`
--

DROP TABLE IF EXISTS `act_ru_variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_variable`
--

LOCK TABLES `act_ru_variable` WRITE;
/*!40000 ALTER TABLE `act_ru_variable` DISABLE KEYS */;
INSERT INTO `act_ru_variable` VALUES ('10002',1,'string','${applyuserid}','10001','10001',NULL,NULL,NULL,NULL,'xiaomi',NULL),('10005',1,'string','applyuserid','10001','10001',NULL,NULL,NULL,NULL,'xiaomi',NULL),('12501',1,'string','deptleaderapprove','10001','10001',NULL,NULL,NULL,NULL,'true',NULL),('12507',1,'string','${starter}','12506','12506',NULL,NULL,NULL,NULL,'xiaomi',NULL),('12510',1,'string','starter','12506','12506',NULL,NULL,NULL,NULL,'xiaomi',NULL),('12514',1,'string','purchaseauditi','12506','12506',NULL,NULL,NULL,NULL,'true',NULL),('12521',1,'string','money','12506','12506',NULL,NULL,NULL,NULL,'20000',NULL),('12522',1,'string','finance','12506','12506',NULL,NULL,NULL,NULL,'true',NULL),('12529',1,'string','${starter}','12528','12528',NULL,NULL,NULL,NULL,'xiaomi',NULL),('12532',1,'string','starter','12528','12528',NULL,NULL,NULL,NULL,'xiaomi',NULL);
/*!40000 ALTER TABLE `act_ru_variable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leaveapply`
--

DROP TABLE IF EXISTS `leaveapply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leaveapply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `process_instance_id` varchar(45) DEFAULT NULL,
  `user_id` varchar(20) DEFAULT NULL,
  `start_time` varchar(45) DEFAULT NULL,
  `end_time` varchar(45) DEFAULT NULL,
  `leave_type` varchar(45) DEFAULT NULL,
  `reason` varchar(400) DEFAULT NULL,
  `apply_time` varchar(100) DEFAULT NULL,
  `reality_start_time` varchar(45) DEFAULT NULL,
  `reality_end_time` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leaveapply`
--

LOCK TABLES `leaveapply` WRITE;
/*!40000 ALTER TABLE `leaveapply` DISABLE KEYS */;
INSERT INTO `leaveapply` VALUES (7,'10001','xiaomi','2016-11-09','2016-11-17','ç—…å‡','è‚šå­ç—›','Wed Nov 02 09:38:16 CST 2016',NULL,NULL);
/*!40000 ALTER TABLE `leaveapply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `permissionname` varchar(45) NOT NULL,
  PRIMARY KEY (`pid`),
  UNIQUE KEY `permissionname_UNIQUE` (`permissionname`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES (2,'äººäº‹å®¡æ‰¹'),(9,'å‡ºçº³ä»˜æ¬¾'),(8,'æ€»ç»ç†å®¡æ‰¹'),(3,'è´¢åŠ¡å®¡æ‰¹'),(1,'éƒ¨é—¨é¢†å¯¼å®¡æ‰¹'),(15,'é‡‡è´­å®¡æ‰¹');
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase`
--

DROP TABLE IF EXISTS `purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemlist` text NOT NULL,
  `total` float NOT NULL,
  `applytime` varchar(45) DEFAULT NULL,
  `applyer` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase`
--

LOCK TABLES `purchase` WRITE;
/*!40000 ALTER TABLE `purchase` DISABLE KEYS */;
INSERT INTO `purchase` VALUES (18,'ä¹°ä¸ªç¯ç¬¼',20000,'2016-11-02 08:31:44.501','xiaomi'),(19,'ä¹°ä¸ªæœˆäº®							',9,'2016-11-02 08:39:09.803','xiaomi'),(20,'1é‡‡è´­å¿˜æƒ…æ°´ä¸€ç“¶	\r\n2ç™½äº‘ä¸€æœµ						',20000,'2016-11-02 09:47:42.229','xiaomi'),(21,'1.ç»™æˆ‘ä¹°ä¸ªé¸¡è›‹							',333,'2016-11-02 09:52:14.46','xiaomi');
/*!40000 ALTER TABLE `purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(45) NOT NULL,
  PRIMARY KEY (`rid`),
  UNIQUE KEY `rolename_UNIQUE` (`rolename`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (9,'äººäº‹'),(10,'å‡ºçº³å‘˜'),(11,'æ€»ç»ç†'),(16,'è´¢åŠ¡ç®¡ç†å‘˜'),(1,'éƒ¨é—¨ç»ç†'),(13,'é‡‡è´­ç»ç†');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_permission`
--

DROP TABLE IF EXISTS `role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_permission` (
  `rpid` int(11) NOT NULL AUTO_INCREMENT,
  `roleid` int(11) NOT NULL,
  `permissionid` int(11) NOT NULL,
  PRIMARY KEY (`rpid`),
  KEY `a_idx` (`roleid`),
  KEY `b_idx` (`permissionid`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_permission`
--

LOCK TABLES `role_permission` WRITE;
/*!40000 ALTER TABLE `role_permission` DISABLE KEYS */;
INSERT INTO `role_permission` VALUES (24,1,3),(25,1,1),(27,9,2),(28,10,9),(34,11,2),(35,11,8),(36,11,1),(37,13,15),(39,16,3);
/*!40000 ALTER TABLE `role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) COLLATE utf8_bin NOT NULL,
  `password` varchar(45) COLLATE utf8_bin NOT NULL,
  `tel` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (31,'xiaomi','1234','110',20),(33,'jon','1234','123',23),(34,'xiaocai','1234','111',32);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `urid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `roleid` int(11) NOT NULL,
  PRIMARY KEY (`urid`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (47,33,9),(48,33,1),(81,31,9),(82,31,10),(83,31,16),(84,31,1),(85,31,13);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-02 10:40:58
