USE [master]
GO
/****** Object:  Database [OuOA]    Script Date: 06/03/2013 14:03:15 ******/
CREATE DATABASE [OuOA] ON  PRIMARY 
( NAME = N'OuOA', FILENAME = N'E:\01Edu\01广州\02DotNet\06Projects\Pro11OA\DB\OuOA.mdf' , SIZE = 7168KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'OuOA_log', FILENAME = N'E:\01Edu\01广州\02DotNet\06Projects\Pro11OA\DB\OuOA_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [OuOA] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OuOA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OuOA] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [OuOA] SET ANSI_NULLS OFF
GO
ALTER DATABASE [OuOA] SET ANSI_PADDING OFF
GO
ALTER DATABASE [OuOA] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [OuOA] SET ARITHABORT OFF
GO
ALTER DATABASE [OuOA] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [OuOA] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [OuOA] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [OuOA] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [OuOA] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [OuOA] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [OuOA] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [OuOA] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [OuOA] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [OuOA] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [OuOA] SET  DISABLE_BROKER
GO
ALTER DATABASE [OuOA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [OuOA] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [OuOA] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [OuOA] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [OuOA] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [OuOA] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [OuOA] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [OuOA] SET  READ_WRITE
GO
ALTER DATABASE [OuOA] SET RECOVERY FULL
GO
ALTER DATABASE [OuOA] SET  MULTI_USER
GO
ALTER DATABASE [OuOA] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [OuOA] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'OuOA', N'ON'
GO
USE [OuOA]
GO
/****** Object:  Table [dbo].[WF_WorkFlow]    Script Date: 06/03/2013 14:03:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WF_WorkFlow](
	[WorkFlowID] [int] IDENTITY(1,1) NOT NULL,
	[WorkFlowName] [nvarchar](50) NULL,
 CONSTRAINT [PK_WF_WORKFLOW] PRIMARY KEY CLUSTERED 
(
	[WorkFlowID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[WF_WorkFlow] ON
INSERT [dbo].[WF_WorkFlow] ([WorkFlowID], [WorkFlowName]) VALUES (1, N'请假管理流程')
INSERT [dbo].[WF_WorkFlow] ([WorkFlowID], [WorkFlowName]) VALUES (2, N'采购管理流程')
SET IDENTITY_INSERT [dbo].[WF_WorkFlow] OFF
/****** Object:  Table [dbo].[WF_NodeState]    Script Date: 06/03/2013 14:03:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WF_NodeState](
	[NodeStateID] [int] IDENTITY(1,1) NOT NULL,
	[NodeStateName] [nvarchar](50) NULL,
 CONSTRAINT [PK_WF_NODESTATE] PRIMARY KEY CLUSTERED 
(
	[NodeStateID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[WF_NodeState] ON
INSERT [dbo].[WF_NodeState] ([NodeStateID], [NodeStateName]) VALUES (1, N'未启用')
INSERT [dbo].[WF_NodeState] ([NodeStateID], [NodeStateName]) VALUES (2, N'待办理')
INSERT [dbo].[WF_NodeState] ([NodeStateID], [NodeStateName]) VALUES (3, N'已办理')
INSERT [dbo].[WF_NodeState] ([NodeStateID], [NodeStateName]) VALUES (4, N'已退回')
SET IDENTITY_INSERT [dbo].[WF_NodeState] OFF
/****** Object:  Table [dbo].[WF_Node]    Script Date: 06/03/2013 14:03:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WF_Node](
	[NodeID] [int] IDENTITY(1,1) NOT NULL,
	[NodeName] [nvarchar](50) NULL,
 CONSTRAINT [PK_WF_NODE] PRIMARY KEY CLUSTERED 
(
	[NodeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[WF_Node] ON
INSERT [dbo].[WF_Node] ([NodeID], [NodeName]) VALUES (1, N'录入')
INSERT [dbo].[WF_Node] ([NodeID], [NodeName]) VALUES (2, N'主管审批')
INSERT [dbo].[WF_Node] ([NodeID], [NodeName]) VALUES (3, N'经理审批')
INSERT [dbo].[WF_Node] ([NodeID], [NodeName]) VALUES (4, N'完成')
INSERT [dbo].[WF_Node] ([NodeID], [NodeName]) VALUES (5, N'采购录入')
INSERT [dbo].[WF_Node] ([NodeID], [NodeName]) VALUES (6, N'财务审批')
INSERT [dbo].[WF_Node] ([NodeID], [NodeName]) VALUES (7, N'经理审批')
SET IDENTITY_INSERT [dbo].[WF_Node] OFF
/****** Object:  Table [dbo].[WF_BillState]    Script Date: 06/03/2013 14:03:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WF_BillState](
	[BillStateID] [int] IDENTITY(1,1) NOT NULL,
	[BillStateName] [nvarchar](50) NULL,
 CONSTRAINT [PK_WF_BILLSTATE] PRIMARY KEY CLUSTERED 
(
	[BillStateID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[WF_BillState] ON
INSERT [dbo].[WF_BillState] ([BillStateID], [BillStateName]) VALUES (1, N'未提交')
INSERT [dbo].[WF_BillState] ([BillStateID], [BillStateName]) VALUES (2, N'审核中')
INSERT [dbo].[WF_BillState] ([BillStateID], [BillStateName]) VALUES (3, N'已完成')
INSERT [dbo].[WF_BillState] ([BillStateID], [BillStateName]) VALUES (4, N'已退回')
INSERT [dbo].[WF_BillState] ([BillStateID], [BillStateName]) VALUES (5, N'已作废')
SET IDENTITY_INSERT [dbo].[WF_BillState] OFF
/****** Object:  Table [dbo].[Ou_Permission]    Script Date: 06/03/2013 14:03:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ou_Permission](
	[pid] [int] IDENTITY(1,1) NOT NULL,
	[pParent] [int] NOT NULL,
	[pName] [varchar](50) NOT NULL,
	[pAreaName] [varchar](50) NULL,
	[pControllerName] [varchar](50) NULL,
	[pActionName] [varchar](50) NULL,
	[pFormMethod] [smallint] NOT NULL,
	[pOperationType] [smallint] NOT NULL,
	[pIco] [varchar](200) NULL,
	[pOrder] [int] NOT NULL,
	[pIsLink] [bit] NOT NULL,
	[pLinkUrl] [varchar](200) NULL,
	[pIsShow] [bit] NOT NULL,
	[pRemark] [varchar](200) NULL,
	[pIsDel] [bit] NOT NULL,
	[pAddTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Ou_Permission] PRIMARY KEY CLUSTERED 
(
	[pid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1-get 2-post' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ou_Permission', @level2type=N'COLUMN',@level2name=N'pFormMethod'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0-无操作 1-easyui连接 2-打开新窗体' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ou_Permission', @level2type=N'COLUMN',@level2name=N'pOperationType'
GO
SET IDENTITY_INSERT [dbo].[Ou_Permission] ON
INSERT [dbo].[Ou_Permission] ([pid], [pParent], [pName], [pAreaName], [pControllerName], [pActionName], [pFormMethod], [pOperationType], [pIco], [pOrder], [pIsLink], [pLinkUrl], [pIsShow], [pRemark], [pIsDel], [pAddTime]) VALUES (1, 0, N'后台菜单导航', N'Admin', N'Permission', N'Index', 1, 0, NULL, 10001, 0, NULL, 1, N'后台菜单导航', 0, CAST(0x0000A1D100000000 AS DateTime))
INSERT [dbo].[Ou_Permission] ([pid], [pParent], [pName], [pAreaName], [pControllerName], [pActionName], [pFormMethod], [pOperationType], [pIco], [pOrder], [pIsLink], [pLinkUrl], [pIsShow], [pRemark], [pIsDel], [pAddTime]) VALUES (2, 1, N'系统管理', NULL, NULL, NULL, 1, 0, NULL, 10001, 0, NULL, 1, NULL, 0, CAST(0x0000A1D1015C19F8 AS DateTime))
INSERT [dbo].[Ou_Permission] ([pid], [pParent], [pName], [pAreaName], [pControllerName], [pActionName], [pFormMethod], [pOperationType], [pIco], [pOrder], [pIsLink], [pLinkUrl], [pIsShow], [pRemark], [pIsDel], [pAddTime]) VALUES (3, 2, N'日志信息', N'Admin', N'Sys', N'Log', 1, 1, NULL, 10002, 0, NULL, 1, NULL, 0, CAST(0x0000A1D1015C2B98 AS DateTime))
INSERT [dbo].[Ou_Permission] ([pid], [pParent], [pName], [pAreaName], [pControllerName], [pActionName], [pFormMethod], [pOperationType], [pIco], [pOrder], [pIsLink], [pLinkUrl], [pIsShow], [pRemark], [pIsDel], [pAddTime]) VALUES (4, 2, N'用户权限管理', N'Admin', N'Sys', N'Permission', 1, 1, NULL, 10003, 0, NULL, 1, NULL, 0, CAST(0x0000A1D1015C35C5 AS DateTime))
INSERT [dbo].[Ou_Permission] ([pid], [pParent], [pName], [pAreaName], [pControllerName], [pActionName], [pFormMethod], [pOperationType], [pIco], [pOrder], [pIsLink], [pLinkUrl], [pIsShow], [pRemark], [pIsDel], [pAddTime]) VALUES (5, 2, N'系统版本信息', N'Admin', N'Sys', N'SysInfo', 1, 1, NULL, 10004, 0, NULL, 1, NULL, 0, CAST(0x0000A1D1015C4909 AS DateTime))
INSERT [dbo].[Ou_Permission] ([pid], [pParent], [pName], [pAreaName], [pControllerName], [pActionName], [pFormMethod], [pOperationType], [pIco], [pOrder], [pIsLink], [pLinkUrl], [pIsShow], [pRemark], [pIsDel], [pAddTime]) VALUES (6, 2, N'论坛管理', N'Admin', N'Sys', N'Bbs', 1, 1, NULL, 10005, 0, NULL, 1, NULL, 0, CAST(0x0000A1D1015C6751 AS DateTime))
SET IDENTITY_INSERT [dbo].[Ou_Permission] OFF
/****** Object:  Table [dbo].[Ou_Department]    Script Date: 06/03/2013 14:03:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ou_Department](
	[depId] [int] IDENTITY(1,1) NOT NULL,
	[depPid] [int] NOT NULL,
	[depName] [varchar](50) NOT NULL,
	[depRemark] [varchar](50) NOT NULL,
	[depIsDel] [bit] NOT NULL,
	[depAddTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Ou_Department] PRIMARY KEY CLUSTERED 
(
	[depId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Ou_Department] ON
INSERT [dbo].[Ou_Department] ([depId], [depPid], [depName], [depRemark], [depIsDel], [depAddTime]) VALUES (1, -2, N'管理员组', N'管理员组', 0, CAST(0x0000A1D100000000 AS DateTime))
INSERT [dbo].[Ou_Department] ([depId], [depPid], [depName], [depRemark], [depIsDel], [depAddTime]) VALUES (2, -1, N'教学部', N'教学部', 0, CAST(0x0000A1D100000000 AS DateTime))
INSERT [dbo].[Ou_Department] ([depId], [depPid], [depName], [depRemark], [depIsDel], [depAddTime]) VALUES (3, -1, N'就业部', N'就业部', 0, CAST(0x0000A1D101611D52 AS DateTime))
INSERT [dbo].[Ou_Department] ([depId], [depPid], [depName], [depRemark], [depIsDel], [depAddTime]) VALUES (4, -1, N'经理办公室', N'经理办公室', 0, CAST(0x0000A1D10161369C AS DateTime))
INSERT [dbo].[Ou_Department] ([depId], [depPid], [depName], [depRemark], [depIsDel], [depAddTime]) VALUES (5, -1, N'咨询部', N'咨询部', 0, CAST(0x0000A1D101614301 AS DateTime))
INSERT [dbo].[Ou_Department] ([depId], [depPid], [depName], [depRemark], [depIsDel], [depAddTime]) VALUES (6, -1, N'财务部', N'财务部', 0, CAST(0x0000A1D1016149E7 AS DateTime))
INSERT [dbo].[Ou_Department] ([depId], [depPid], [depName], [depRemark], [depIsDel], [depAddTime]) VALUES (7, -1, N'行政部', N'行政部', 0, CAST(0x0000A1D10161512B AS DateTime))
INSERT [dbo].[Ou_Department] ([depId], [depPid], [depName], [depRemark], [depIsDel], [depAddTime]) VALUES (8, -1, N'学工部', N'学工部', 0, CAST(0x0000A1D101620A9B AS DateTime))
SET IDENTITY_INSERT [dbo].[Ou_Department] OFF
/****** Object:  StoredProcedure [dbo].[proc_GetLeaveList]    Script Date: 06/03/2013 14:03:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_GetLeaveList] 
@NodeID int,--节点ID
@OpType int --取数类型(0 待办  1 已办)
AS

BEGIN   
DECLARE @SQL NVARCHAR(MAX)
 
 
SET @SQL='select bill.Leave,bill.Name,bill.BeginDate,bill.EndDate,billState.BillStateName,FLNode.BillFlowNodeID from Bill_Leave bill '

SET @SQL = @SQL+
'join WF_BillFlowNode FLNode on FLNode.WorkFlowID =bill.WorkFlowID and FLNode.BillID=bill.Leave
join WF_WorkFlowNode WFNode on WFNode.WorkFlowID = FLNode.WorkFlowID and WFNode.WorkFlowNodeID=FLNode.WorkFlowNodeID 
join WF_BillState billState on billState.BillStateID= bill.BillStateID  
where WFNode.NodeID=@NodeID'

if  @OPType = 0 
   --待办
	SET @SQL = @SQL +' and FLNode.NodeStateID in (2)'	--(1:未启用，2:待办理，3：已办理，4：已退回)	 
else 
   --已办
	SET @SQL = @SQL +' and FLNode.NodeStateID in (3,4)'	--(1:未启用，2:待办理，3：已办理，4：已退回)	 
	 
EXEC sp_executesql @SQL, N'@NodeID int', @NodeID =@NodeID;

/*
select bill.Leave,bill.Name,bill.BeginDate,bill.EndDate,billState.BillStateName,FLNode.BillFlowNodeID from Bill_Leave bill  
join WF_BillFlowNode FLNode on FLNode.WorkFlowID =bill.WorkFlowID and FLNode.BillID=bill.Leave
join WF_WorkFlowNode WFNode on WFNode.WorkFlowID = FLNode.WorkFlowID and WFNode.WorkFlowNodeID=FLNode.WorkFlowNodeID 
join WF_BillState billState on billState.BillStateID= bill.BillStateID
*/

END
GO
/****** Object:  Table [dbo].[WF_WorkFlowNode]    Script Date: 06/03/2013 14:03:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WF_WorkFlowNode](
	[WorkFlowNodeID] [int] IDENTITY(1,1) NOT NULL,
	[WorkFlowID] [int] NULL,
	[NodeID] [int] NULL,
	[WorkFlowNodeSequence] [int] NULL,
	[Remark] [nvarchar](50) NULL,
 CONSTRAINT [PK_WF_WORKFLOWNODE] PRIMARY KEY CLUSTERED 
(
	[WorkFlowNodeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[WF_WorkFlowNode] ON
INSERT [dbo].[WF_WorkFlowNode] ([WorkFlowNodeID], [WorkFlowID], [NodeID], [WorkFlowNodeSequence], [Remark]) VALUES (1, 1, 1, 1, N'录入')
INSERT [dbo].[WF_WorkFlowNode] ([WorkFlowNodeID], [WorkFlowID], [NodeID], [WorkFlowNodeSequence], [Remark]) VALUES (2, 1, 2, 2, N'主管审批')
INSERT [dbo].[WF_WorkFlowNode] ([WorkFlowNodeID], [WorkFlowID], [NodeID], [WorkFlowNodeSequence], [Remark]) VALUES (3, 1, 3, 3, N'经理审批')
INSERT [dbo].[WF_WorkFlowNode] ([WorkFlowNodeID], [WorkFlowID], [NodeID], [WorkFlowNodeSequence], [Remark]) VALUES (4, 1, 4, 4, N'完成')
INSERT [dbo].[WF_WorkFlowNode] ([WorkFlowNodeID], [WorkFlowID], [NodeID], [WorkFlowNodeSequence], [Remark]) VALUES (5, 2, 1, 1, N'录入')
INSERT [dbo].[WF_WorkFlowNode] ([WorkFlowNodeID], [WorkFlowID], [NodeID], [WorkFlowNodeSequence], [Remark]) VALUES (6, 2, 5, 2, N'采购录入')
INSERT [dbo].[WF_WorkFlowNode] ([WorkFlowNodeID], [WorkFlowID], [NodeID], [WorkFlowNodeSequence], [Remark]) VALUES (7, 2, 6, 3, N'财务审批')
INSERT [dbo].[WF_WorkFlowNode] ([WorkFlowNodeID], [WorkFlowID], [NodeID], [WorkFlowNodeSequence], [Remark]) VALUES (8, 2, 3, 4, N'经理审批')
INSERT [dbo].[WF_WorkFlowNode] ([WorkFlowNodeID], [WorkFlowID], [NodeID], [WorkFlowNodeSequence], [Remark]) VALUES (9, 2, 4, 5, N'完成')
SET IDENTITY_INSERT [dbo].[WF_WorkFlowNode] OFF
/****** Object:  Table [dbo].[Bill_Leave]    Script Date: 06/03/2013 14:03:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill_Leave](
	[Leave] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[BeginDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[BillStateID] [int] NULL,
	[WorkFlowID] [int] NULL,
 CONSTRAINT [PK_Bill_Leave] PRIMARY KEY CLUSTERED 
(
	[Leave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Bill_Leave] ON
INSERT [dbo].[Bill_Leave] ([Leave], [Name], [BeginDate], [EndDate], [BillStateID], [WorkFlowID]) VALUES (6, N'11111', CAST(0x0000A0FC00000000 AS DateTime), CAST(0x0000A10500000000 AS DateTime), 5, 1)
INSERT [dbo].[Bill_Leave] ([Leave], [Name], [BeginDate], [EndDate], [BillStateID], [WorkFlowID]) VALUES (7, N'刘小', CAST(0x0000A0FC00000000 AS DateTime), CAST(0x0000A26A00000000 AS DateTime), 3, 1)
INSERT [dbo].[Bill_Leave] ([Leave], [Name], [BeginDate], [EndDate], [BillStateID], [WorkFlowID]) VALUES (8, N'007', CAST(0x00009E5E00000000 AS DateTime), CAST(0x00009E5F00000000 AS DateTime), 3, 1)
INSERT [dbo].[Bill_Leave] ([Leave], [Name], [BeginDate], [EndDate], [BillStateID], [WorkFlowID]) VALUES (1007, N'产品介绍', CAST(0x0000A0FC00000000 AS DateTime), CAST(0x0000A10500000000 AS DateTime), 4, 1)
INSERT [dbo].[Bill_Leave] ([Leave], [Name], [BeginDate], [EndDate], [BillStateID], [WorkFlowID]) VALUES (1008, N'产品介绍', CAST(0x0000A0FC00000000 AS DateTime), CAST(0x0000A10500000000 AS DateTime), 3, 1)
INSERT [dbo].[Bill_Leave] ([Leave], [Name], [BeginDate], [EndDate], [BillStateID], [WorkFlowID]) VALUES (1009, N'0002', CAST(0x0000A0FC00000000 AS DateTime), CAST(0x0000A10500000000 AS DateTime), 4, 1)
SET IDENTITY_INSERT [dbo].[Bill_Leave] OFF
/****** Object:  Table [dbo].[Ou_UserInfo]    Script Date: 06/03/2013 14:03:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ou_UserInfo](
	[uId] [int] IDENTITY(1,1) NOT NULL,
	[uDepId] [int] NOT NULL,
	[uLoginName] [varchar](50) NOT NULL,
	[uPwd] [char](32) NOT NULL,
	[uGender] [bit] NOT NULL,
	[uPost] [varchar](50) NOT NULL,
	[uRemark] [varchar](50) NOT NULL,
	[uIsDel] [bit] NOT NULL,
	[uAddTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Ou_UserInfo] PRIMARY KEY CLUSTERED 
(
	[uId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_FK_Ou_UserInfo_Ou_Department] ON [dbo].[Ou_UserInfo] 
(
	[uDepId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'部门id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ou_UserInfo', @level2type=N'COLUMN',@level2name=N'uDepId'
GO
SET IDENTITY_INSERT [dbo].[Ou_UserInfo] ON
INSERT [dbo].[Ou_UserInfo] ([uId], [uDepId], [uLoginName], [uPwd], [uGender], [uPost], [uRemark], [uIsDel], [uAddTime]) VALUES (3, 1, N'admin', N'4297F44B13955235245B2497399D7A93', 0, N'1', N'1', 0, CAST(0x0000A1D1016A8D62 AS DateTime))
SET IDENTITY_INSERT [dbo].[Ou_UserInfo] OFF
/****** Object:  Table [dbo].[Ou_Role]    Script Date: 06/03/2013 14:03:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ou_Role](
	[rId] [int] IDENTITY(1,1) NOT NULL,
	[rDepId] [int] NOT NULL,
	[rName] [varchar](50) NOT NULL,
	[rRemark] [varchar](50) NOT NULL,
	[rIsShow] [bit] NOT NULL,
	[rIsDel] [bit] NOT NULL,
	[rAddTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Ou_Role] PRIMARY KEY CLUSTERED 
(
	[rId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_FK_Ou_Role_Ou_Department] ON [dbo].[Ou_Role] 
(
	[rDepId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Ou_Role] ON
INSERT [dbo].[Ou_Role] ([rId], [rDepId], [rName], [rRemark], [rIsShow], [rIsDel], [rAddTime]) VALUES (1, 1, N'.Net老师', N'.Net老师', 1, 0, CAST(0x0000A1CE00000000 AS DateTime))
INSERT [dbo].[Ou_Role] ([rId], [rDepId], [rName], [rRemark], [rIsShow], [rIsDel], [rAddTime]) VALUES (2, 1, N'Java老师', N'Java老师', 1, 0, CAST(0x0000A1D10161ED6E AS DateTime))
INSERT [dbo].[Ou_Role] ([rId], [rDepId], [rName], [rRemark], [rIsShow], [rIsDel], [rAddTime]) VALUES (3, 8, N'班主任', N'班主任', 1, 0, CAST(0x0000A1D1016223A0 AS DateTime))
SET IDENTITY_INSERT [dbo].[Ou_Role] OFF
/****** Object:  Table [dbo].[Ou_UserVipPermission]    Script Date: 06/03/2013 14:03:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ou_UserVipPermission](
	[vipId] [int] IDENTITY(1,1) NOT NULL,
	[vipUserId] [int] NOT NULL,
	[vipPermission] [int] NOT NULL,
	[vipRemark] [varchar](50) NOT NULL,
	[vipIsDel] [bit] NOT NULL,
	[vipAddTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Ou_UserVipPermission] PRIMARY KEY CLUSTERED 
(
	[vipId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_FK_Ou_UserVipPermission_Ou_Permission] ON [dbo].[Ou_UserVipPermission] 
(
	[vipPermission] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FK_Ou_UserVipPermission_Ou_UserInfo] ON [dbo].[Ou_UserVipPermission] 
(
	[vipUserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ou_UserRole]    Script Date: 06/03/2013 14:03:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ou_UserRole](
	[urId] [int] IDENTITY(1,1) NOT NULL,
	[urUId] [int] NOT NULL,
	[urRId] [int] NOT NULL,
	[urIsDel] [bit] NOT NULL,
	[urAddtime] [datetime] NOT NULL,
 CONSTRAINT [PK_Ou_UserRole] PRIMARY KEY CLUSTERED 
(
	[urId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FK_Ou_UserRole_Ou_Role] ON [dbo].[Ou_UserRole] 
(
	[urRId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FK_Ou_UserRole_Ou_UserInfo] ON [dbo].[Ou_UserRole] 
(
	[urUId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ou_RolePermission]    Script Date: 06/03/2013 14:03:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ou_RolePermission](
	[rpId] [int] IDENTITY(1,1) NOT NULL,
	[rpRId] [int] NOT NULL,
	[rpPId] [int] NOT NULL,
	[rpIsDel] [bit] NOT NULL,
	[rpAddTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Ou_RolePermission] PRIMARY KEY CLUSTERED 
(
	[rpId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FK_Ou_RolePermission_Ou_Permission] ON [dbo].[Ou_RolePermission] 
(
	[rpPId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FK_Ou_RolePermission_Ou_Role] ON [dbo].[Ou_RolePermission] 
(
	[rpRId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ou_RolePermission', @level2type=N'COLUMN',@level2name=N'rpRId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'权限id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ou_RolePermission', @level2type=N'COLUMN',@level2name=N'rpPId'
GO
SET IDENTITY_INSERT [dbo].[Ou_RolePermission] ON
INSERT [dbo].[Ou_RolePermission] ([rpId], [rpRId], [rpPId], [rpIsDel], [rpAddTime]) VALUES (1, 1, 2, 0, CAST(0x0000A1D10162E04B AS DateTime))
INSERT [dbo].[Ou_RolePermission] ([rpId], [rpRId], [rpPId], [rpIsDel], [rpAddTime]) VALUES (2, 1, 3, 0, CAST(0x0000A1D10162E5CD AS DateTime))
INSERT [dbo].[Ou_RolePermission] ([rpId], [rpRId], [rpPId], [rpIsDel], [rpAddTime]) VALUES (3, 1, 4, 0, CAST(0x0000A1D10162E773 AS DateTime))
INSERT [dbo].[Ou_RolePermission] ([rpId], [rpRId], [rpPId], [rpIsDel], [rpAddTime]) VALUES (4, 1, 5, 0, CAST(0x0000A1D10162E906 AS DateTime))
INSERT [dbo].[Ou_RolePermission] ([rpId], [rpRId], [rpPId], [rpIsDel], [rpAddTime]) VALUES (5, 1, 6, 0, CAST(0x0000A1D10162EBB1 AS DateTime))
SET IDENTITY_INSERT [dbo].[Ou_RolePermission] OFF
/****** Object:  Table [dbo].[WF_BillFlowNode]    Script Date: 06/03/2013 14:03:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WF_BillFlowNode](
	[BillFlowNodeID] [int] IDENTITY(1,1) NOT NULL,
	[WorkFlowNodeID] [int] NULL,
	[NodeStateID] [int] NULL,
	[WorkFlowID] [int] NULL,
	[BillID] [int] NULL,
 CONSTRAINT [PK_WF_BILLFLOWNODE] PRIMARY KEY CLUSTERED 
(
	[BillFlowNodeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[WF_BillFlowNode] ON
INSERT [dbo].[WF_BillFlowNode] ([BillFlowNodeID], [WorkFlowNodeID], [NodeStateID], [WorkFlowID], [BillID]) VALUES (9, 1, 3, 1, 6)
INSERT [dbo].[WF_BillFlowNode] ([BillFlowNodeID], [WorkFlowNodeID], [NodeStateID], [WorkFlowID], [BillID]) VALUES (10, 2, 3, 1, 6)
INSERT [dbo].[WF_BillFlowNode] ([BillFlowNodeID], [WorkFlowNodeID], [NodeStateID], [WorkFlowID], [BillID]) VALUES (11, 3, 3, 1, 6)
INSERT [dbo].[WF_BillFlowNode] ([BillFlowNodeID], [WorkFlowNodeID], [NodeStateID], [WorkFlowID], [BillID]) VALUES (12, 4, 3, 1, 6)
INSERT [dbo].[WF_BillFlowNode] ([BillFlowNodeID], [WorkFlowNodeID], [NodeStateID], [WorkFlowID], [BillID]) VALUES (13, 1, 3, 1, 7)
INSERT [dbo].[WF_BillFlowNode] ([BillFlowNodeID], [WorkFlowNodeID], [NodeStateID], [WorkFlowID], [BillID]) VALUES (14, 2, 3, 1, 7)
INSERT [dbo].[WF_BillFlowNode] ([BillFlowNodeID], [WorkFlowNodeID], [NodeStateID], [WorkFlowID], [BillID]) VALUES (15, 3, 3, 1, 7)
INSERT [dbo].[WF_BillFlowNode] ([BillFlowNodeID], [WorkFlowNodeID], [NodeStateID], [WorkFlowID], [BillID]) VALUES (16, 4, 3, 1, 7)
INSERT [dbo].[WF_BillFlowNode] ([BillFlowNodeID], [WorkFlowNodeID], [NodeStateID], [WorkFlowID], [BillID]) VALUES (17, 1, 3, 1, 8)
INSERT [dbo].[WF_BillFlowNode] ([BillFlowNodeID], [WorkFlowNodeID], [NodeStateID], [WorkFlowID], [BillID]) VALUES (18, 2, 3, 1, 8)
INSERT [dbo].[WF_BillFlowNode] ([BillFlowNodeID], [WorkFlowNodeID], [NodeStateID], [WorkFlowID], [BillID]) VALUES (19, 3, 3, 1, 8)
INSERT [dbo].[WF_BillFlowNode] ([BillFlowNodeID], [WorkFlowNodeID], [NodeStateID], [WorkFlowID], [BillID]) VALUES (20, 4, 3, 1, 8)
INSERT [dbo].[WF_BillFlowNode] ([BillFlowNodeID], [WorkFlowNodeID], [NodeStateID], [WorkFlowID], [BillID]) VALUES (1013, 1, 2, 1, 1007)
INSERT [dbo].[WF_BillFlowNode] ([BillFlowNodeID], [WorkFlowNodeID], [NodeStateID], [WorkFlowID], [BillID]) VALUES (1014, 2, 4, 1, 1007)
INSERT [dbo].[WF_BillFlowNode] ([BillFlowNodeID], [WorkFlowNodeID], [NodeStateID], [WorkFlowID], [BillID]) VALUES (1015, 3, 1, 1, 1007)
INSERT [dbo].[WF_BillFlowNode] ([BillFlowNodeID], [WorkFlowNodeID], [NodeStateID], [WorkFlowID], [BillID]) VALUES (1016, 4, 1, 1, 1007)
INSERT [dbo].[WF_BillFlowNode] ([BillFlowNodeID], [WorkFlowNodeID], [NodeStateID], [WorkFlowID], [BillID]) VALUES (1017, 1, 3, 1, 1008)
INSERT [dbo].[WF_BillFlowNode] ([BillFlowNodeID], [WorkFlowNodeID], [NodeStateID], [WorkFlowID], [BillID]) VALUES (1018, 2, 3, 1, 1008)
INSERT [dbo].[WF_BillFlowNode] ([BillFlowNodeID], [WorkFlowNodeID], [NodeStateID], [WorkFlowID], [BillID]) VALUES (1019, 3, 3, 1, 1008)
INSERT [dbo].[WF_BillFlowNode] ([BillFlowNodeID], [WorkFlowNodeID], [NodeStateID], [WorkFlowID], [BillID]) VALUES (1020, 4, 3, 1, 1008)
INSERT [dbo].[WF_BillFlowNode] ([BillFlowNodeID], [WorkFlowNodeID], [NodeStateID], [WorkFlowID], [BillID]) VALUES (1021, 1, 2, 1, 1009)
INSERT [dbo].[WF_BillFlowNode] ([BillFlowNodeID], [WorkFlowNodeID], [NodeStateID], [WorkFlowID], [BillID]) VALUES (1022, 2, 4, 1, 1009)
INSERT [dbo].[WF_BillFlowNode] ([BillFlowNodeID], [WorkFlowNodeID], [NodeStateID], [WorkFlowID], [BillID]) VALUES (1023, 3, 1, 1, 1009)
INSERT [dbo].[WF_BillFlowNode] ([BillFlowNodeID], [WorkFlowNodeID], [NodeStateID], [WorkFlowID], [BillID]) VALUES (1024, 4, 1, 1, 1009)
SET IDENTITY_INSERT [dbo].[WF_BillFlowNode] OFF
/****** Object:  Table [dbo].[WF_AutoTransactNode]    Script Date: 06/03/2013 14:03:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WF_AutoTransactNode](
	[AutoTransactNodeID] [int] IDENTITY(1,1) NOT NULL,
	[WorkFlowNodeID] [int] NULL,
 CONSTRAINT [PK_WF_AUTOTRANSACTNODE] PRIMARY KEY CLUSTERED 
(
	[AutoTransactNodeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[WF_AutoTransactNode] ON
INSERT [dbo].[WF_AutoTransactNode] ([AutoTransactNodeID], [WorkFlowNodeID]) VALUES (1, 4)
INSERT [dbo].[WF_AutoTransactNode] ([AutoTransactNodeID], [WorkFlowNodeID]) VALUES (2, 9)
SET IDENTITY_INSERT [dbo].[WF_AutoTransactNode] OFF
/****** Object:  Table [dbo].[WF_BillFlowNodeRemark]    Script Date: 06/03/2013 14:03:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WF_BillFlowNodeRemark](
	[BillFlowNodeRemarkID] [int] IDENTITY(1,1) NOT NULL,
	[BillFlowNodeID] [int] NULL,
	[TransactorID] [int] NULL,
	[Transactor] [nvarchar](50) NULL,
	[TransactorDate] [datetime] NULL,
	[TransactorOperation] [nvarchar](50) NULL,
	[TransactorRemark] [nvarchar](max) NULL,
 CONSTRAINT [PK_WF_BILLFLOWNODEREMARK] PRIMARY KEY CLUSTERED 
(
	[BillFlowNodeRemarkID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[WF_BillFlowNodeRemark] ON
INSERT [dbo].[WF_BillFlowNodeRemark] ([BillFlowNodeRemarkID], [BillFlowNodeID], [TransactorID], [Transactor], [TransactorDate], [TransactorOperation], [TransactorRemark]) VALUES (3, 9, 1, N'系统管理员', CAST(0x0000A144017AD507 AS DateTime), N'提交', N'22222222222')
INSERT [dbo].[WF_BillFlowNodeRemark] ([BillFlowNodeRemarkID], [BillFlowNodeID], [TransactorID], [Transactor], [TransactorDate], [TransactorOperation], [TransactorRemark]) VALUES (4, 10, 1, N'仓库管理员', CAST(0x0000A145001E1478 AS DateTime), N'办理通过', N'
                    ')
INSERT [dbo].[WF_BillFlowNodeRemark] ([BillFlowNodeRemarkID], [BillFlowNodeID], [TransactorID], [Transactor], [TransactorDate], [TransactorOperation], [TransactorRemark]) VALUES (5, 11, 1, N'仓库管理员', CAST(0x0000A145001F3C7C AS DateTime), N'退回上级', N'
                    ')
INSERT [dbo].[WF_BillFlowNodeRemark] ([BillFlowNodeRemarkID], [BillFlowNodeID], [TransactorID], [Transactor], [TransactorDate], [TransactorOperation], [TransactorRemark]) VALUES (6, 10, 1, N'仓库管理员', CAST(0x0000A145001F5DF9 AS DateTime), N'退回上级', N'
                    ')
INSERT [dbo].[WF_BillFlowNodeRemark] ([BillFlowNodeRemarkID], [BillFlowNodeID], [TransactorID], [Transactor], [TransactorDate], [TransactorOperation], [TransactorRemark]) VALUES (7, 9, 1, N'系统管理员', CAST(0x0000A14500243B99 AS DateTime), N'办理通过', N'')
INSERT [dbo].[WF_BillFlowNodeRemark] ([BillFlowNodeRemarkID], [BillFlowNodeID], [TransactorID], [Transactor], [TransactorDate], [TransactorOperation], [TransactorRemark]) VALUES (8, 10, 1, N'仓库管理员', CAST(0x0000A145002448DE AS DateTime), N'退回上级', N'哈哈哈
                    ')
INSERT [dbo].[WF_BillFlowNodeRemark] ([BillFlowNodeRemarkID], [BillFlowNodeID], [TransactorID], [Transactor], [TransactorDate], [TransactorOperation], [TransactorRemark]) VALUES (9, 9, 1, N'仓库管理员', CAST(0x0000A14500244F0B AS DateTime), N'作废', N'')
INSERT [dbo].[WF_BillFlowNodeRemark] ([BillFlowNodeRemarkID], [BillFlowNodeID], [TransactorID], [Transactor], [TransactorDate], [TransactorOperation], [TransactorRemark]) VALUES (10, 9, 1, N'系统管理员', CAST(0x0000A14500286569 AS DateTime), N'办理通过', N'haha')
INSERT [dbo].[WF_BillFlowNodeRemark] ([BillFlowNodeRemarkID], [BillFlowNodeID], [TransactorID], [Transactor], [TransactorDate], [TransactorOperation], [TransactorRemark]) VALUES (11, 13, 1, N'系统管理员', CAST(0x0000A145002A98B6 AS DateTime), N'提交', N'请一年的假')
INSERT [dbo].[WF_BillFlowNodeRemark] ([BillFlowNodeRemarkID], [BillFlowNodeID], [TransactorID], [Transactor], [TransactorDate], [TransactorOperation], [TransactorRemark]) VALUES (12, 10, 1, N'仓库管理员', CAST(0x0000A145002AB345 AS DateTime), N'退回上级', N'
                    ')
INSERT [dbo].[WF_BillFlowNodeRemark] ([BillFlowNodeRemarkID], [BillFlowNodeID], [TransactorID], [Transactor], [TransactorDate], [TransactorOperation], [TransactorRemark]) VALUES (13, 14, 1, N'仓库管理员', CAST(0x0000A145002AC13E AS DateTime), N'办理通过', N'一年的假也敢请？                  ')
INSERT [dbo].[WF_BillFlowNodeRemark] ([BillFlowNodeRemarkID], [BillFlowNodeID], [TransactorID], [Transactor], [TransactorDate], [TransactorOperation], [TransactorRemark]) VALUES (14, 15, 1, N'仓库管理员', CAST(0x0000A145002AD371 AS DateTime), N'办理通过', N'你敢请我就敢批')
INSERT [dbo].[WF_BillFlowNodeRemark] ([BillFlowNodeRemarkID], [BillFlowNodeID], [TransactorID], [Transactor], [TransactorDate], [TransactorOperation], [TransactorRemark]) VALUES (15, 16, 1, N'仓库管理员', CAST(0x0000A145002AD371 AS DateTime), N'自动归档', N'自动归档')
INSERT [dbo].[WF_BillFlowNodeRemark] ([BillFlowNodeRemarkID], [BillFlowNodeID], [TransactorID], [Transactor], [TransactorDate], [TransactorOperation], [TransactorRemark]) VALUES (16, 9, 1, N'仓库管理员', CAST(0x0000A145002B11BF AS DateTime), N'作废', N'')
INSERT [dbo].[WF_BillFlowNodeRemark] ([BillFlowNodeRemarkID], [BillFlowNodeID], [TransactorID], [Transactor], [TransactorDate], [TransactorOperation], [TransactorRemark]) VALUES (17, 17, 1, N'系统管理员', CAST(0x0000A145002B6EA5 AS DateTime), N'提交', N'请假三天')
INSERT [dbo].[WF_BillFlowNodeRemark] ([BillFlowNodeRemarkID], [BillFlowNodeID], [TransactorID], [Transactor], [TransactorDate], [TransactorOperation], [TransactorRemark]) VALUES (18, 18, 1, N'仓库管理员', CAST(0x0000A145002B848C AS DateTime), N'退回上级', N'三天太长了 改短一点')
INSERT [dbo].[WF_BillFlowNodeRemark] ([BillFlowNodeRemarkID], [BillFlowNodeID], [TransactorID], [Transactor], [TransactorDate], [TransactorOperation], [TransactorRemark]) VALUES (19, 17, 1, N'系统管理员', CAST(0x0000A145002B95B5 AS DateTime), N'办理通过', N'请假一天')
INSERT [dbo].[WF_BillFlowNodeRemark] ([BillFlowNodeRemarkID], [BillFlowNodeID], [TransactorID], [Transactor], [TransactorDate], [TransactorOperation], [TransactorRemark]) VALUES (20, 18, 1, N'仓库管理员', CAST(0x0000A145002BA113 AS DateTime), N'办理通过', N'一天可以 批准
                    ')
INSERT [dbo].[WF_BillFlowNodeRemark] ([BillFlowNodeRemarkID], [BillFlowNodeID], [TransactorID], [Transactor], [TransactorDate], [TransactorOperation], [TransactorRemark]) VALUES (21, 19, 1, N'仓库管理员', CAST(0x0000A145002BAC59 AS DateTime), N'办理通过', N'我也批准')
INSERT [dbo].[WF_BillFlowNodeRemark] ([BillFlowNodeRemarkID], [BillFlowNodeID], [TransactorID], [Transactor], [TransactorDate], [TransactorOperation], [TransactorRemark]) VALUES (22, 20, 1, N'仓库管理员', CAST(0x0000A145002BAC5A AS DateTime), N'自动归档', N'自动完成')
INSERT [dbo].[WF_BillFlowNodeRemark] ([BillFlowNodeRemarkID], [BillFlowNodeID], [TransactorID], [Transactor], [TransactorDate], [TransactorOperation], [TransactorRemark]) VALUES (1010, 1013, 1, N'系统管理员', CAST(0x0000A145011165D4 AS DateTime), N'提交', N'123123')
INSERT [dbo].[WF_BillFlowNodeRemark] ([BillFlowNodeRemarkID], [BillFlowNodeID], [TransactorID], [Transactor], [TransactorDate], [TransactorOperation], [TransactorRemark]) VALUES (1011, 1014, 1, N'仓库管理员', CAST(0x0000A14501116CBB AS DateTime), N'退回上级', N'')
INSERT [dbo].[WF_BillFlowNodeRemark] ([BillFlowNodeRemarkID], [BillFlowNodeID], [TransactorID], [Transactor], [TransactorDate], [TransactorOperation], [TransactorRemark]) VALUES (1012, 1017, 1, N'系统管理员', CAST(0x0000A1450111C838 AS DateTime), N'提交', N'123123')
INSERT [dbo].[WF_BillFlowNodeRemark] ([BillFlowNodeRemarkID], [BillFlowNodeID], [TransactorID], [Transactor], [TransactorDate], [TransactorOperation], [TransactorRemark]) VALUES (1013, 1021, 1, N'系统管理员', CAST(0x0000A1450111FAAE AS DateTime), N'提交', N'aaaaaaa')
INSERT [dbo].[WF_BillFlowNodeRemark] ([BillFlowNodeRemarkID], [BillFlowNodeID], [TransactorID], [Transactor], [TransactorDate], [TransactorOperation], [TransactorRemark]) VALUES (1014, 1018, 1, N'仓库管理员', CAST(0x0000A1450113A7A6 AS DateTime), N'办理通过', N'请假审核')
INSERT [dbo].[WF_BillFlowNodeRemark] ([BillFlowNodeRemarkID], [BillFlowNodeID], [TransactorID], [Transactor], [TransactorDate], [TransactorOperation], [TransactorRemark]) VALUES (1015, 1019, 1, N'仓库管理员', CAST(0x0000A1450113F41C AS DateTime), N'办理通过', N'')
INSERT [dbo].[WF_BillFlowNodeRemark] ([BillFlowNodeRemarkID], [BillFlowNodeID], [TransactorID], [Transactor], [TransactorDate], [TransactorOperation], [TransactorRemark]) VALUES (1016, 1020, 1, N'仓库管理员', CAST(0x0000A1450113F41C AS DateTime), N'自动归档', N'自动完成')
INSERT [dbo].[WF_BillFlowNodeRemark] ([BillFlowNodeRemarkID], [BillFlowNodeID], [TransactorID], [Transactor], [TransactorDate], [TransactorOperation], [TransactorRemark]) VALUES (1017, 1022, 1, N'仓库管理员', CAST(0x0000A14501141E88 AS DateTime), N'退回上级', N'')
SET IDENTITY_INSERT [dbo].[WF_BillFlowNodeRemark] OFF
/****** Object:  StoredProcedure [dbo].[Proc_WorkFlow_Interface]    Script Date: 06/03/2013 14:03:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Proc_WorkFlow_Interface]
    --当前节点ID(新增时为0 ，流转时要提交相关的节点ID)
    @BillFlowNodeID int,
	--单据ID
	@BillID int,
    --流程ID
	@WorkFlowID int,
    --节点ID
    @NodeID  int,
    --操作类型(0提交 1退回 2作废)
    @OPType  int , 
    --处理人ID
    @TransactorID int,
    --处理人姓名
    @Transactor nvarchar(50),	
    --处理备注
    @TransactorRemark nvarchar(200)
AS
   
declare @tmpF_Count int set @tmpF_Count = 0 
--当前节点索引
declare @tmpF_NowNodeIndex int  set @tmpF_NowNodeIndex= 0 
--当前流程节点最大索引
declare @tmpF_FL_MaxNodeIndex int set @tmpF_FL_MaxNodeIndex =0  
--表单状态
declare @tmpF_BillSTATE int set  @tmpF_BillSTATE =1
--处理状态名称
declare @tmpF_OPENAME nvarchar(10) 
--当前办理节点数
declare @tmpF_NowOpNodeCount int set @tmpF_NowOpNodeCount = 0 
BEGIN 
 
	--Proc_WorkFlow_Interface注释文档
	----@OPType  操作类型(0提交 1退回 2作废)

	--1 首先判断 操作类型   如果是0 和 1 
	----1.1 判断是否存在工作流，如果不存在，就新建一个工作流。
	----1.2 如果 OPType=0 （提交）
	------1.2.1 如果工作流是刚刚新建的
	--------1.2.1.1 把第一个节点改为已办。
	--------1.2.1.2 把第二个节点改为待办。		
	------1.2.2 如果工作流不是刚刚新建的
	--------1.2.2.1 把当前节点改为已办。
	--------1.2.2.2 把下一节点改为待办。
	------1.2.3 把单据状态改为 待审核。
	----1.3 如果是OpType=1（退回）
	------1.3.1 把当前节点改为 已退回
	------1.3.2 把上一节点改为 待办理
	------1.3.3 把单据状态改为 已退回
	----1.4 修改单据状态
	----1.5 插入操作记录
	----1.6 处理自动归档节点，插入操作记录

	--2 否则就是作废
	----2.1 把工作流的所有节点状态改为已办理
	----2.2 把单据状态改为 已作废
	----2.3 插入操作记录 

	--1 首先判断 操作类型   如果是0 和 1 
	if @OPType = 0 or @OPType = 1  
		begin        	 

			----1.1 判断是否存在工作流，如果不存在，就新建一个工作流。
			begin
			SET NOCOUNT ON; 
			Select @tmpF_Count = Count(*) From WF_BillFlowNode t  Where t.WorkFlowID =@WorkFlowID  and BillID = @BillID;  
			if (@tmpF_Count = 0)
			begin
				--不存在数据， 添加流转节点  状态为未启用 
				Insert Into WF_BillFlowNode(BillID, WorkFlowID, WorkFlowNodeID, NodeStateID)
				Select @BillID, wf.WorkFlowID, node.WorkFlowNodeID, 1--未启用
				From WF_WorkFlow wf join  WF_WorkFlowNode node on  wf.WorkFlowID=node.WorkFlowID 
				Where  wf.WorkFlowID = @WorkFlowID 
				order by node.WorkFlowNodeSequence asc 
			end    
			end
			 
			----1.2 如果 OPType=0 （提交） 
		    if @OPType = 0 
				begin	 
					------1.2.1 如果工作流是刚刚新建的
					if (@tmpF_Count = 0 ) 
					   begin 
							--------1.2.2.1 把当前节点改为已办。 
							begin
						   declare @firstNode int; 

						   Select @firstNode=node.WorkFlowNodeID From WF_WorkFlow wf, WF_WorkFlowNode node 
						   Where wf.WorkFlowID = node.WorkFlowID and node.WorkFlowNodeSequence = 1 and wf.WorkFlowID = @WorkFlowID

							Update WF_BillFlowNode Set  NodeStateID = 3 
							Where  BillID = @BillID 
							and WorkFlowID = @WorkFlowID 
							and WorkFlowNodeID =@firstNode

							select @BillFlowNodeID= BillFlowNodeID from WF_BillFlowNode where BillID=@BillID and WorkFlowID = @WorkFlowID and WorkFlowNodeID =@firstNode
							end
							--------1.2.1.2 把第二个节点改为待办。
							begin
							 declare @secondNode int; 

						     Select @secondNode=node.WorkFlowNodeID From WF_WorkFlow wf, WF_WorkFlowNode node 
						     Where wf.WorkFlowID = node.WorkFlowID and node.WorkFlowNodeSequence = 2 and wf.WorkFlowID = @WorkFlowID

							 Update WF_BillFlowNode
							 Set  NodeStateID = 2
							 Where   BillID = @BillID
							   and WorkFlowID = @WorkFlowID
							   and WorkFlowNodeID =@secondNode
							end
							--表单状态为 已提交
							set @tmpF_BillSTATE  = 2;
					   end 
					else 
					------1.2.2 如果工作流不是刚刚新建的
					   begin
					   --------1.2.2.1 把当前节点改为已办。
						--启动当前节点的下一节点为待办状态， 当前节点为已办状态
						--得到当前节点索引
						Select @tmpF_NowNodeIndex = node.WorkFlowNodeSequence
						From WF_WorkFlow wf 
						join WF_WorkFlowNode node on wf.WorkFlowID = node.WorkFlowID
						join WF_BillFlowNode billNode on node.WorkFlowNodeID = billNode.WorkFlowNodeID
						Where  wf.WorkFlowID = @WorkFlowID
							  and node.NodeID = @NodeID 
							  and billNode.BillFlowNodeID = @BillFlowNodeID

						--更新当前节点为已办 
						Update WF_BillFlowNode  Set NodeStateID = 3 Where BillFlowNodeID = @BillFlowNodeID 
						--------1.2.2.2 把下一节点改为待办。
						--得到当前流程最大节点索引
						--得到流程节点最大索引
						Select @tmpF_FL_MaxNodeIndex = max(node.WorkFlowNodeSequence)
						From WF_WorkFlow wf join   WF_WorkFlowNode node on wf.WorkFlowID = node.WorkFlowID
						Where wf.WorkFlowID = @WorkFlowID 
						--当前节点 = 最大节点索引， 代表当前已流转完成
						  if @tmpF_NowNodeIndex = @tmpF_FL_MaxNodeIndex 
							 begin 
								--表单状态为  审核完成 
								set @tmpF_BillSTATE = 3
							 end 
						 else 
							 begin
								--存在后继节点更新当前节点状态为 已办， 启动下一节点
								declare @nextNodeId int
								Select @nextNodeId=WorkFlowNodeID 
								From WF_WorkFlow wf join WF_WorkFlowNode node on wf.WorkFlowID = node.WorkFlowID
								Where wf.WorkFlowID = @WorkFlowID  and WorkFlowNodeSequence = @tmpF_NowNodeIndex + 1 

								Update WF_BillFlowNode Set NodeStateID = 2
								Where BillID = @BillID and WorkFlowID = @WorkFlowID and WorkFlowNodeID = @nextNodeId
								
								------1.2.3 把单据状态改为 待审核。 
								set @tmpF_BillSTATE  = 2;
							 end 
					   end 
				end 
  			 else 
				----1.3 如果是OpType=1（退回） 
				begin 
					------1.3.1 把当前节点改为 已退回
					begin
					--得到当前节点索引
					Select @tmpF_NowNodeIndex = node.WorkFlowNodeSequence
					From WF_WorkFlow wf join  WF_WorkFlowNode node on wf.WorkFlowID=node.WorkFlowID
					join  WF_BillFlowNode billNode on  node.WorkFlowNodeID=billNode.WorkFlowNodeID
					Where  wf.WorkFlowID = @WorkFlowID
						  and node.NodeID = @NodeID
						  and node.WorkFlowNodeID = billNode.WorkFlowNodeID
						  and billNode.BillFlowNodeID = @BillFlowNodeID
					--更新当前节点状态为退回
					Update WF_BillFlowNode  Set NodeStateID = 4 Where  BillFlowNodeID = @BillFlowNodeID   
					end
					------1.3.2 把上一节点改为 待办理
					begin
					--更新上级节点为启动
					declare @preNodeID int
  
					Select @preNodeID=WorkFlowNodeID 
					From WF_WorkFlow wf join WF_WorkFlowNode node on wf.WorkFlowID = node.WorkFlowID
					Where wf.WorkFlowID = @WorkFlowID  and WorkFlowNodeSequence = @tmpF_NowNodeIndex - 1 

					Update WF_BillFlowNode Set NodeStateID = 2
					Where BillID = @BillID and WorkFlowID = @WorkFlowID and WorkFlowNodeID = @preNodeID
					------1.3.3 把单据状态改为 已退回
						begin
						set @tmpF_BillSTATE  = 4;
						end
					end
				end  
			  
			----1.4 修改单据状态
			begin
			if @WorkFlowID = 1 
				--1	请假
				Update dbo.Bill_Leave set BillStateID = @tmpF_BillSTATE where Leave = @BillID 
			end
		  
			----1.5 插入操作记录
			begin
			if @tmpF_Count = 0 
				begin 
					--如果是新创建的工作流
					 set @tmpF_OPENAME = '提交'
				end 
			else 
			   begin
				   if @OPType = 0 
						set @tmpF_OPENAME = '办理通过'
				   else 
						set @tmpF_OPENAME = '退回上级'
			end 
			Insert Into WF_BillFlowNodeRemark(
			 			BillFlowNodeID,
			 			Transactor,
			 			TransactorID,
			 			TransactorDate,
			 			TransactorOperation,
			 			TransactorRemark)
			 Values(@BillFlowNodeID,@Transactor,@TransactorID, getdate(), @tmpF_OPENAME , @TransactorRemark )	 
		    end
		   
			----1.6 处理自动归档节点，插入操作记录 
			begin
		   if @OPType = 0
			begin
				  set @tmpF_Count = 0 
				  Select @tmpF_Count = Count(*)
				  From (
						  Select wf.WorkFlowID, node.WorkFlowNodeID
						  From WF_WorkFlow wf  join WF_WorkFlowNode node on wf.WorkFlowID=node.WorkFlowID
						  join WF_BillFlowNode BillNode on BillNode.WorkFlowNodeID = node.WorkFlowNodeID
						  Where BillNode.NodeStateID = 2  
						  and BillNode.BillID = @BillID
						  and BillNode.WorkFlowID = @WorkFlowID
					) NodeInfo join WF_AutoTransactNode AutoNode on NodeInfo.WorkFlowNodeID= AutoNode.WorkFlowNodeID 
					 
				 if @tmpF_Count > 0 
					begin 
						--进行归档
						--1, 得到当前待办节点ID
						Select  @BillFlowNodeID = BillFlowNodeID 
						From WF_BillFlowNode BillNode
						Where BillNode.NodeStateID = 2
							  and BillNode.BillID = @BillID
							  and BillNode.WorkFlowID = @WorkFlowID 
						--2, 更新节点状态为已办
						Update WF_BillFlowNode
						Set NodeStateID = 3
						Where BillFlowNodeID = @BillFlowNodeID 

						--3, 添加自动归档备注
						set @tmpF_OPENAME = '自动归档'
					   Insert Into WF_BillFlowNodeRemark(
									BillFlowNodeID,
									Transactor,
									TransactorID,
									TransactorDate,
									TransactorOperation,
									TransactorRemark)
						Values(@BillFlowNodeID,@Transactor,@TransactorID, getdate(), @tmpF_OPENAME , '自动完成' )	

						--更新表单状态为已完成
						set @tmpF_BillSTATE = 3

						--更新表单状态 
						if @WorkFlowID = 1 
							--1	请假
							Update dbo.Bill_Leave set BillStateID=@tmpF_BillSTATE where Leave=@BillID   
					end 
			end 
			end
   end
	--2 否则就是作废
    if @OPType = 2 
		begin 
			----2.1 把工作流的所有节点状态改为已办理
			begin
			Update dbo.WF_BillFlowNode
			Set NodeStateID = 3
			Where BillID = @BillID and WorkFlowID = @WorkFlowID
			end
			----2.2 把单据状态改为 已作废
			begin
		   if @WorkFlowID = 1 
		   --1	请假条   
		   Update [dbo].[Bill_Leave] Set BillStateID = 5 Where [Leave]= @BillID 
		   end
		   ----2.3 插入操作记录 
		   begin
			set @tmpF_OPENAME = '作废' 
			Insert Into WF_BillFlowNodeRemark(
							BillFlowNodeID,
							Transactor,
							TransactorID,
							TransactorDate,
							TransactorOperation,
							TransactorRemark)
			Values(@BillFlowNodeID,@Transactor,@TransactorID, getdate(), @tmpF_OPENAME , @TransactorRemark ) 
			end
		end   
END
GO
/****** Object:  StoredProcedure [dbo].[Proc_WorkFlow_BillRemark_List]    Script Date: 06/03/2013 14:03:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Proc_WorkFlow_BillRemark_List]
	@BillID int, 
	@WorkFlowID int 
AS
BEGIN
	Select Node.NodeName, Transactor, TransactorDate, TransactorOperation, TransactorRemark
	From WF_BillFlowNodeRemark BillNodeRemark 
	join WF_BillFlowNode BillNode on BillNode.BillFlowNodeID = BillNodeRemark.BillFlowNodeID 
	join WF_WorkFlowNode WFNode on  WFNode.WorkFlowNodeID = BillNode.WorkFlowNodeID
	join WF_Node Node on Node.NodeID= WFNode.NodeID 
	Where BillNode.BillID = @BillID and BillNode.WorkFlowID = @WorkFlowID
    order by TransactorDate asc, BillFlowNodeRemarkID asc
END
GO
/****** Object:  StoredProcedure [dbo].[proc_LeaveConfirm]    Script Date: 06/03/2013 14:03:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_LeaveConfirm]
@BillID int,
@BillFlowNodeID int,
@Remark nvarchar(1000), --备注
@Transactor nvarchar(50),
@TransactorID int,
@OPType  int --操作类型(0提交 1退回 2作废)
AS  
DECLARE @NodeID int 
BEGIN  
	SET NOCOUNT OFF; 
	BEGIN TRAN --开始事务  

	select @NodeID =WFNode.NodeID FROM WF_BillFlowNode   BFNode 
	join WF_WorkFlowNode WFNode on WFNode.WorkFlowNodeID = BFNode.WorkFlowNodeID
	WHERE BillFlowNodeID=@BillFlowNodeID
	
	DECLARE @error_var int

	exec [dbo].[Proc_WorkFlow_Interface] @BillFlowNodeID,@BillID,1,@NodeID,@OPType,@TransactorID,@Transactor,@Remark
	
	COMMIT TRAN
	return 1		 
END
GO
/****** Object:  StoredProcedure [dbo].[proc_InsertLeave]    Script Date: 06/03/2013 14:03:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_InsertLeave]
@name nvarchar(50),
@beginDate DATETIME,
@endDate DATETIME,
@Transactor nvarchar(50),
@TransactorID int,
@TransactorRemark nvarchar(1000) --备注
AS 
declare @error_var int 
declare @rowcount_var int

declare @result int  --操作结果(1 成功 0错误) 

declare @BillFlowNodeID int --当前节点ID(提交时为0 以后流转时， 要提交相关的节点ID)	
declare	@BillID int --表单ID 
declare	@WorkFlowID int --流程类型ID(1.请假)
declare @NodeID  int  --节点ID
declare @OPType  int --操作类型(0提交 1退回)
BEGIN  
	SET NOCOUNT OFF;
	  
	BEGIN TRAN --开始事务 
	  
	set @WorkFlowID=1 --请假
	insert dbo.Bill_Leave(Name,BeginDate,EndDate,WorkFlowID)
	values(@name,@beginDate,@endDate,@WorkFlowID)		 
	 
	 
	 SELECT @error_var = @@ERROR,   @rowcount_var = @@ROWCOUNT    
				IF @error_var <> 0
				BEGIN
					ROLLBACK TRAN  
					return  -1
				END

				IF @rowcount_var = 0     
				BEGIN
					ROLLBACK TRAN 
					return  -1
				END
			set @BillID=@@identity 

	set @BillFlowNodeID=0 --插入信息时为0
	set @NodeID=1 --录入
	set @OPType=0 --提交
	exec [dbo].[Proc_WorkFlow_Interface] 
	@BillFlowNodeID,@BillID,@WorkFlowID,@NodeID,
	@OPType,@TransactorID,@Transactor,@TransactorRemark
	 			
	COMMIT TRAN
	return  1
END
GO
/****** Object:  StoredProcedure [dbo].[proc_EditLeave]    Script Date: 06/03/2013 14:03:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_EditLeave]
@billId int,
@billFlowNodeId int,
@name nvarchar(50),
@beginDate DATETIME,
@endDate DATETIME,
@Transactor nvarchar(50),
@TransactorID int,
@TransactorRemark nvarchar(1000) --备注
AS 
declare @error_var int 
declare @rowcount_var int

declare @result int  --操作结果(1 成功 0错误) 
  
BEGIN  
	SET NOCOUNT OFF;
	  
	BEGIN TRAN --开始事务 
	   
	UPDATE dbo.Bill_Leave set Name=@name,BeginDate=@beginDate,EndDate=@endDate where Leave=@billId
		 
	SELECT @error_var = @@ERROR,   @rowcount_var = @@ROWCOUNT    
	IF @error_var <> 0
	BEGIN
		ROLLBACK TRAN  
		return  -1
	END

	IF @rowcount_var = 0     
	BEGIN
		ROLLBACK TRAN 
		return  -1
	END 
			  
	exec [dbo].[proc_LeaveConfirm] @billId,@billFlowNodeId,@TransactorRemark,@Transactor,@TransactorID,0 --操作类型(0提交 1退回 2作废)
 
	COMMIT TRAN
	return  1
END
GO
/****** Object:  Default [DF_Ou_Permission_pFormMethod]    Script Date: 06/03/2013 14:03:16 ******/
ALTER TABLE [dbo].[Ou_Permission] ADD  CONSTRAINT [DF_Ou_Permission_pFormMethod]  DEFAULT ((1)) FOR [pFormMethod]
GO
/****** Object:  Default [DF_Ou_Permission_pOperationType]    Script Date: 06/03/2013 14:03:16 ******/
ALTER TABLE [dbo].[Ou_Permission] ADD  CONSTRAINT [DF_Ou_Permission_pOperationType]  DEFAULT ((1)) FOR [pOperationType]
GO
/****** Object:  Default [DF_Ou_Permission_pOrder]    Script Date: 06/03/2013 14:03:16 ******/
ALTER TABLE [dbo].[Ou_Permission] ADD  CONSTRAINT [DF_Ou_Permission_pOrder]  DEFAULT ((10001)) FOR [pOrder]
GO
/****** Object:  Default [DF_Ou_Permission_pIsLink]    Script Date: 06/03/2013 14:03:16 ******/
ALTER TABLE [dbo].[Ou_Permission] ADD  CONSTRAINT [DF_Ou_Permission_pIsLink]  DEFAULT ((0)) FOR [pIsLink]
GO
/****** Object:  Default [DF_Ou_Permission_pIsShow]    Script Date: 06/03/2013 14:03:16 ******/
ALTER TABLE [dbo].[Ou_Permission] ADD  CONSTRAINT [DF_Ou_Permission_pIsShow]  DEFAULT ((1)) FOR [pIsShow]
GO
/****** Object:  Default [DF_Ou_Permission_pIsDel]    Script Date: 06/03/2013 14:03:16 ******/
ALTER TABLE [dbo].[Ou_Permission] ADD  CONSTRAINT [DF_Ou_Permission_pIsDel]  DEFAULT ((0)) FOR [pIsDel]
GO
/****** Object:  Default [DF_Ou_Permission_pAddTime]    Script Date: 06/03/2013 14:03:16 ******/
ALTER TABLE [dbo].[Ou_Permission] ADD  CONSTRAINT [DF_Ou_Permission_pAddTime]  DEFAULT (getdate()) FOR [pAddTime]
GO
/****** Object:  Default [DF_Ou_Department_depPid]    Script Date: 06/03/2013 14:03:16 ******/
ALTER TABLE [dbo].[Ou_Department] ADD  CONSTRAINT [DF_Ou_Department_depPid]  DEFAULT ((-1)) FOR [depPid]
GO
/****** Object:  Default [DF_Ou_Department_depIsDel]    Script Date: 06/03/2013 14:03:16 ******/
ALTER TABLE [dbo].[Ou_Department] ADD  CONSTRAINT [DF_Ou_Department_depIsDel]  DEFAULT ((0)) FOR [depIsDel]
GO
/****** Object:  Default [DF_Ou_Department_depAddTime]    Script Date: 06/03/2013 14:03:16 ******/
ALTER TABLE [dbo].[Ou_Department] ADD  CONSTRAINT [DF_Ou_Department_depAddTime]  DEFAULT (getdate()) FOR [depAddTime]
GO
/****** Object:  Default [DF_Ou_UserInfo_uGender]    Script Date: 06/03/2013 14:03:17 ******/
ALTER TABLE [dbo].[Ou_UserInfo] ADD  CONSTRAINT [DF_Ou_UserInfo_uGender]  DEFAULT ((0)) FOR [uGender]
GO
/****** Object:  Default [DF_Ou_UserInfo_uIsDel]    Script Date: 06/03/2013 14:03:17 ******/
ALTER TABLE [dbo].[Ou_UserInfo] ADD  CONSTRAINT [DF_Ou_UserInfo_uIsDel]  DEFAULT ((0)) FOR [uIsDel]
GO
/****** Object:  Default [DF_Ou_UserInfo_uAddTime]    Script Date: 06/03/2013 14:03:17 ******/
ALTER TABLE [dbo].[Ou_UserInfo] ADD  CONSTRAINT [DF_Ou_UserInfo_uAddTime]  DEFAULT (getdate()) FOR [uAddTime]
GO
/****** Object:  Default [DF_Ou_Role_rDepId]    Script Date: 06/03/2013 14:03:17 ******/
ALTER TABLE [dbo].[Ou_Role] ADD  CONSTRAINT [DF_Ou_Role_rDepId]  DEFAULT ((-1)) FOR [rDepId]
GO
/****** Object:  Default [DF_Ou_Role_rIsShow]    Script Date: 06/03/2013 14:03:17 ******/
ALTER TABLE [dbo].[Ou_Role] ADD  CONSTRAINT [DF_Ou_Role_rIsShow]  DEFAULT ((1)) FOR [rIsShow]
GO
/****** Object:  Default [DF_Ou_Role_rIsDel]    Script Date: 06/03/2013 14:03:17 ******/
ALTER TABLE [dbo].[Ou_Role] ADD  CONSTRAINT [DF_Ou_Role_rIsDel]  DEFAULT ((0)) FOR [rIsDel]
GO
/****** Object:  Default [DF_Ou_Role_rAddTime]    Script Date: 06/03/2013 14:03:17 ******/
ALTER TABLE [dbo].[Ou_Role] ADD  CONSTRAINT [DF_Ou_Role_rAddTime]  DEFAULT (getdate()) FOR [rAddTime]
GO
/****** Object:  Default [DF_Ou_RolePermission_rpIsDel]    Script Date: 06/03/2013 14:03:17 ******/
ALTER TABLE [dbo].[Ou_RolePermission] ADD  CONSTRAINT [DF_Ou_RolePermission_rpIsDel]  DEFAULT ((0)) FOR [rpIsDel]
GO
/****** Object:  Default [DF_Ou_RolePermission_rpAddTime]    Script Date: 06/03/2013 14:03:17 ******/
ALTER TABLE [dbo].[Ou_RolePermission] ADD  CONSTRAINT [DF_Ou_RolePermission_rpAddTime]  DEFAULT (getdate()) FOR [rpAddTime]
GO
/****** Object:  ForeignKey [FK_WF_WORKFLOWNODE_REFERENCE_2_WF_WORKFLOW]    Script Date: 06/03/2013 14:03:17 ******/
ALTER TABLE [dbo].[WF_WorkFlowNode]  WITH CHECK ADD  CONSTRAINT [FK_WF_WORKFLOWNODE_REFERENCE_2_WF_WORKFLOW] FOREIGN KEY([WorkFlowID])
REFERENCES [dbo].[WF_WorkFlow] ([WorkFlowID])
GO
ALTER TABLE [dbo].[WF_WorkFlowNode] CHECK CONSTRAINT [FK_WF_WORKFLOWNODE_REFERENCE_2_WF_WORKFLOW]
GO
/****** Object:  ForeignKey [FK_WF_WORKFLOWNODE_REFERENCE_3_WF_NODE]    Script Date: 06/03/2013 14:03:17 ******/
ALTER TABLE [dbo].[WF_WorkFlowNode]  WITH CHECK ADD  CONSTRAINT [FK_WF_WORKFLOWNODE_REFERENCE_3_WF_NODE] FOREIGN KEY([NodeID])
REFERENCES [dbo].[WF_Node] ([NodeID])
GO
ALTER TABLE [dbo].[WF_WorkFlowNode] CHECK CONSTRAINT [FK_WF_WORKFLOWNODE_REFERENCE_3_WF_NODE]
GO
/****** Object:  ForeignKey [FK_BILL_LEAVE_REFERENCE_10_WF_BILLSTATE]    Script Date: 06/03/2013 14:03:17 ******/
ALTER TABLE [dbo].[Bill_Leave]  WITH CHECK ADD  CONSTRAINT [FK_BILL_LEAVE_REFERENCE_10_WF_BILLSTATE] FOREIGN KEY([BillStateID])
REFERENCES [dbo].[WF_BillState] ([BillStateID])
GO
ALTER TABLE [dbo].[Bill_Leave] CHECK CONSTRAINT [FK_BILL_LEAVE_REFERENCE_10_WF_BILLSTATE]
GO
/****** Object:  ForeignKey [FK_BILL_LEAVE_REFERENCE_11_WF_WORKFLOW]    Script Date: 06/03/2013 14:03:17 ******/
ALTER TABLE [dbo].[Bill_Leave]  WITH CHECK ADD  CONSTRAINT [FK_BILL_LEAVE_REFERENCE_11_WF_WORKFLOW] FOREIGN KEY([WorkFlowID])
REFERENCES [dbo].[WF_WorkFlow] ([WorkFlowID])
GO
ALTER TABLE [dbo].[Bill_Leave] CHECK CONSTRAINT [FK_BILL_LEAVE_REFERENCE_11_WF_WORKFLOW]
GO
/****** Object:  ForeignKey [FK_Ou_UserInfo_Ou_Department]    Script Date: 06/03/2013 14:03:17 ******/
ALTER TABLE [dbo].[Ou_UserInfo]  WITH CHECK ADD  CONSTRAINT [FK_Ou_UserInfo_Ou_Department] FOREIGN KEY([uDepId])
REFERENCES [dbo].[Ou_Department] ([depId])
GO
ALTER TABLE [dbo].[Ou_UserInfo] CHECK CONSTRAINT [FK_Ou_UserInfo_Ou_Department]
GO
/****** Object:  ForeignKey [FK_Ou_Role_Ou_Department]    Script Date: 06/03/2013 14:03:17 ******/
ALTER TABLE [dbo].[Ou_Role]  WITH CHECK ADD  CONSTRAINT [FK_Ou_Role_Ou_Department] FOREIGN KEY([rDepId])
REFERENCES [dbo].[Ou_Department] ([depId])
GO
ALTER TABLE [dbo].[Ou_Role] CHECK CONSTRAINT [FK_Ou_Role_Ou_Department]
GO
/****** Object:  ForeignKey [FK_Ou_UserVipPermission_Ou_Permission]    Script Date: 06/03/2013 14:03:17 ******/
ALTER TABLE [dbo].[Ou_UserVipPermission]  WITH CHECK ADD  CONSTRAINT [FK_Ou_UserVipPermission_Ou_Permission] FOREIGN KEY([vipPermission])
REFERENCES [dbo].[Ou_Permission] ([pid])
GO
ALTER TABLE [dbo].[Ou_UserVipPermission] CHECK CONSTRAINT [FK_Ou_UserVipPermission_Ou_Permission]
GO
/****** Object:  ForeignKey [FK_Ou_UserVipPermission_Ou_UserInfo]    Script Date: 06/03/2013 14:03:17 ******/
ALTER TABLE [dbo].[Ou_UserVipPermission]  WITH CHECK ADD  CONSTRAINT [FK_Ou_UserVipPermission_Ou_UserInfo] FOREIGN KEY([vipUserId])
REFERENCES [dbo].[Ou_UserInfo] ([uId])
GO
ALTER TABLE [dbo].[Ou_UserVipPermission] CHECK CONSTRAINT [FK_Ou_UserVipPermission_Ou_UserInfo]
GO
/****** Object:  ForeignKey [FK_Ou_UserRole_Ou_Role]    Script Date: 06/03/2013 14:03:17 ******/
ALTER TABLE [dbo].[Ou_UserRole]  WITH CHECK ADD  CONSTRAINT [FK_Ou_UserRole_Ou_Role] FOREIGN KEY([urRId])
REFERENCES [dbo].[Ou_Role] ([rId])
GO
ALTER TABLE [dbo].[Ou_UserRole] CHECK CONSTRAINT [FK_Ou_UserRole_Ou_Role]
GO
/****** Object:  ForeignKey [FK_Ou_UserRole_Ou_UserInfo]    Script Date: 06/03/2013 14:03:17 ******/
ALTER TABLE [dbo].[Ou_UserRole]  WITH CHECK ADD  CONSTRAINT [FK_Ou_UserRole_Ou_UserInfo] FOREIGN KEY([urUId])
REFERENCES [dbo].[Ou_UserInfo] ([uId])
GO
ALTER TABLE [dbo].[Ou_UserRole] CHECK CONSTRAINT [FK_Ou_UserRole_Ou_UserInfo]
GO
/****** Object:  ForeignKey [FK_Ou_RolePermission_Ou_Permission]    Script Date: 06/03/2013 14:03:17 ******/
ALTER TABLE [dbo].[Ou_RolePermission]  WITH CHECK ADD  CONSTRAINT [FK_Ou_RolePermission_Ou_Permission] FOREIGN KEY([rpPId])
REFERENCES [dbo].[Ou_Permission] ([pid])
GO
ALTER TABLE [dbo].[Ou_RolePermission] CHECK CONSTRAINT [FK_Ou_RolePermission_Ou_Permission]
GO
/****** Object:  ForeignKey [FK_Ou_RolePermission_Ou_Role]    Script Date: 06/03/2013 14:03:17 ******/
ALTER TABLE [dbo].[Ou_RolePermission]  WITH CHECK ADD  CONSTRAINT [FK_Ou_RolePermission_Ou_Role] FOREIGN KEY([rpRId])
REFERENCES [dbo].[Ou_Role] ([rId])
GO
ALTER TABLE [dbo].[Ou_RolePermission] CHECK CONSTRAINT [FK_Ou_RolePermission_Ou_Role]
GO
/****** Object:  ForeignKey [FK_WF_BILLFLOWNODE_REFERENCE_6_WF_WORKFLOWNODE]    Script Date: 06/03/2013 14:03:17 ******/
ALTER TABLE [dbo].[WF_BillFlowNode]  WITH CHECK ADD  CONSTRAINT [FK_WF_BILLFLOWNODE_REFERENCE_6_WF_WORKFLOWNODE] FOREIGN KEY([WorkFlowNodeID])
REFERENCES [dbo].[WF_WorkFlowNode] ([WorkFlowNodeID])
GO
ALTER TABLE [dbo].[WF_BillFlowNode] CHECK CONSTRAINT [FK_WF_BILLFLOWNODE_REFERENCE_6_WF_WORKFLOWNODE]
GO
/****** Object:  ForeignKey [FK_WF_BILLFLOWNODE_REFERENCE_7_WF_NODESTATE]    Script Date: 06/03/2013 14:03:17 ******/
ALTER TABLE [dbo].[WF_BillFlowNode]  WITH CHECK ADD  CONSTRAINT [FK_WF_BILLFLOWNODE_REFERENCE_7_WF_NODESTATE] FOREIGN KEY([NodeStateID])
REFERENCES [dbo].[WF_NodeState] ([NodeStateID])
GO
ALTER TABLE [dbo].[WF_BillFlowNode] CHECK CONSTRAINT [FK_WF_BILLFLOWNODE_REFERENCE_7_WF_NODESTATE]
GO
/****** Object:  ForeignKey [FK_WF_BILLFLOWNODE_REFERENCE_8_WF_WORKFLOW]    Script Date: 06/03/2013 14:03:17 ******/
ALTER TABLE [dbo].[WF_BillFlowNode]  WITH CHECK ADD  CONSTRAINT [FK_WF_BILLFLOWNODE_REFERENCE_8_WF_WORKFLOW] FOREIGN KEY([WorkFlowID])
REFERENCES [dbo].[WF_WorkFlow] ([WorkFlowID])
GO
ALTER TABLE [dbo].[WF_BillFlowNode] CHECK CONSTRAINT [FK_WF_BILLFLOWNODE_REFERENCE_8_WF_WORKFLOW]
GO
/****** Object:  ForeignKey [FK_WF_AUTOTRANSACTNOD_REFERENCE_4_WF_WORKFLOWNODE]    Script Date: 06/03/2013 14:03:17 ******/
ALTER TABLE [dbo].[WF_AutoTransactNode]  WITH CHECK ADD  CONSTRAINT [FK_WF_AUTOTRANSACTNOD_REFERENCE_4_WF_WORKFLOWNODE] FOREIGN KEY([WorkFlowNodeID])
REFERENCES [dbo].[WF_WorkFlowNode] ([WorkFlowNodeID])
GO
ALTER TABLE [dbo].[WF_AutoTransactNode] CHECK CONSTRAINT [FK_WF_AUTOTRANSACTNOD_REFERENCE_4_WF_WORKFLOWNODE]
GO
/****** Object:  ForeignKey [FK_WF_BILLFLOWNODEREM_REFERENCE_9_WF_BILLFLOWNODE]    Script Date: 06/03/2013 14:03:17 ******/
ALTER TABLE [dbo].[WF_BillFlowNodeRemark]  WITH CHECK ADD  CONSTRAINT [FK_WF_BILLFLOWNODEREM_REFERENCE_9_WF_BILLFLOWNODE] FOREIGN KEY([BillFlowNodeID])
REFERENCES [dbo].[WF_BillFlowNode] ([BillFlowNodeID])
GO
ALTER TABLE [dbo].[WF_BillFlowNodeRemark] CHECK CONSTRAINT [FK_WF_BILLFLOWNODEREM_REFERENCE_9_WF_BILLFLOWNODE]
GO
