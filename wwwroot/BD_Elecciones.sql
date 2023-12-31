USE [master]
GO
/****** Object:  Database [BD_Elecciones]    Script Date: 25/06/2023 16:35:09 ******/

GO
ALTER DATABASE [BD_Elecciones] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BD_Elecciones] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BD_Elecciones] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BD_Elecciones] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BD_Elecciones] SET ARITHABORT OFF 
GO
ALTER DATABASE [BD_Elecciones] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BD_Elecciones] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BD_Elecciones] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BD_Elecciones] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BD_Elecciones] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BD_Elecciones] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BD_Elecciones] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BD_Elecciones] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BD_Elecciones] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BD_Elecciones] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BD_Elecciones] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BD_Elecciones] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BD_Elecciones] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BD_Elecciones] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BD_Elecciones] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BD_Elecciones] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BD_Elecciones] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BD_Elecciones] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BD_Elecciones] SET  MULTI_USER 
GO
ALTER DATABASE [BD_Elecciones] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BD_Elecciones] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BD_Elecciones] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BD_Elecciones] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BD_Elecciones] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BD_Elecciones] SET QUERY_STORE = OFF
GO
USE [BD_Elecciones]
GO
/****** Object:  Table [dbo].[Candidatos]    Script Date: 25/06/2023 16:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Candidatos](
	[IdCandidato] [int] IDENTITY(1,1) NOT NULL,
	[IdPartido] [int] NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[Foto] [text] NOT NULL,
	[Postulacion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Candidatos] PRIMARY KEY CLUSTERED 
(
	[IdCandidato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partidos]    Script Date: 25/06/2023 16:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partidos](
	[IdPartido] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Logo] [text] NOT NULL,
	[SitioWeb] [varchar](50) NOT NULL,
	[FechaFundacion] [date] NOT NULL,
	[CantidadDiputados] [int] NOT NULL,
	[CantidadSenadores] [int] NOT NULL,
 CONSTRAINT [PK_Partidos] PRIMARY KEY CLUSTERED 
(
	[IdPartido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Partidos] ON 

INSERT [dbo].[Partidos] ([IdPartido], [Nombre], [Logo], [SitioWeb], [FechaFundacion], [CantidadDiputados], [CantidadSenadores]) VALUES (1, N'La Libertad Avanza', N'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/Logo_La_Libertad_Avanza.png/1200px-Logo_La_Libertad_Avanza.png', N'https://lalibertadavanza.com.ar/', CAST(N'2021-07-14' AS Date), 3, 0)
INSERT [dbo].[Partidos] ([IdPartido], [Nombre], [Logo], [SitioWeb], [FechaFundacion], [CantidadDiputados], [CantidadSenadores]) VALUES (3, N'Juntos por el Cambio', N'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f1/Juntos-Por-El-Cambio-Logo.svg/2560px-Juntos-Por-El-Cambio-Logo.svg.png', N'https://jxc.com.ar/', CAST(N'2019-06-12' AS Date), 50, 31)
INSERT [dbo].[Partidos] ([IdPartido], [Nombre], [Logo], [SitioWeb], [FechaFundacion], [CantidadDiputados], [CantidadSenadores]) VALUES (4, N'Frente de Todos', N'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c4/Frente_de_Todos_logo.svg/2560px-Frente_de_Todos_logo.svg.png', N'https://www.frentedetodos.org/', CAST(N'2019-06-12' AS Date), 118, 33)
SET IDENTITY_INSERT [dbo].[Partidos] OFF
GO
ALTER TABLE [dbo].[Candidatos]  WITH CHECK ADD  CONSTRAINT [FK_Candidatos_Partidos] FOREIGN KEY([IdPartido])
REFERENCES [dbo].[Partidos] ([IdPartido])
GO
ALTER TABLE [dbo].[Candidatos] CHECK CONSTRAINT [FK_Candidatos_Partidos]
GO
USE [master]
GO
ALTER DATABASE [BD_Elecciones] SET  READ_WRITE 
GO
