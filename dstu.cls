% за основу взято
% ******* Клас для написання документів за ДСТУ 3008-95 ********
% ***** автори: Тавров Д. Ю., Борисенко П. Б., Дутчак І. О. ****

%
% TODO: Можна використати для скидання лічильника замість задавання 0
% \counterwithin{figure}{section}
% \counterwithin{table}{section}
%

% Ідентифікація класу
\ProvidesClass{xedstu}[Клас для написання документів за ДСТУ]
\NeedsTeXFormat{LaTeX2e} % потрібний формат

% "Батьківський клас"
\LoadClass[a4paper,14pt,ukrainian,oneside,xetex]{extreport}
% Необхідні пакети
\RequirePackage{fontspec} % XeTeX замість попередніх для PDFLaTex

\RequirePackage{xunicode} % Unicode для XeTeX
\RequirePackage{xltxtra}

\RequirePackage{listings} % Вставка лістингів програм
\RequirePackage[verbatim]{lstfiracode} % лігатури для лістингу
% \RequirePackage{xcolor} % кольори для стилів

% Мова
\RequirePackage{polyglossia}
% мова та нумерація
\setdefaultlanguage[numerals=cyrillic-alph]{ukrainian}

% Шрифти, xelatex
\defaultfontfeatures{Ligatures=TeX}
% Times New Roman за вимогами
% без порушень ліцензії на Dual Boot Linux машині можна змонтувати диск
% на якому стоїть ліцензійний Windows та перекинути лінками в /etc/font потрібні шрифти
\setmainfont{Times New Roman}
\newfontfamily\cyrillicfont{Times New Roman}
% або це
% \setsansfont{Linux Libertine O}
% \newfontfamily\cyrillicfont{Linux Libertine O}
% або
% \setromanfont[Mapping=tex-text]{Linux Libertine O}
%
\setmonofont[Contextuals={Alternate}]{JetBrains Mono} % https://www.jetbrains.com/lp/mono/
\newfontfamily{\cyrillicfonttt}[Contextuals={Alternate}]{JetBrains Mono}

% або
% \setmonofont{FiraCode-Regular.otf}[Contextuals=Alternate]



%% вставка з dstu.cls
% графічні пакети
\RequirePackage{subfig} % пакет для вставки підрисунків
\RequirePackage{flafter} % пакет гарантує, що рисунок чи таблиця ніколи не з'являться раніше посилання на самих себе
\RequirePackage{caption} % пакет для персоналізації заголовків рисунків та таблиць
\RequirePackage{xtab} % пакет для довгих таблиць
\RequirePackage{longtable} % пакет для довгих таблиць
\RequirePackage{multirow} % пакет для об'єднання рядків таблиці
\RequirePackage{array} % пакет для вирівнювання всередині таблиці

% пакети для форматування відступів та полів
\RequirePackage[includehead, headsep=0pt, footskip=0pt, top=2cm, bottom=2cm, left=2cm, right=1cm]{geometry} % задаємо поля сторінки
\RequirePackage{indentfirst} % відступ для першого рядка абзацу
\RequirePackage{hanging} % відступ для всіх інших рядків абзацу
\RequirePackage[shortlabels]{enumitem}	% пакет для форматування списків
\RequirePackage{setspace}	% пакет для того, щоб можна було задати міжрядковий інтервал
\RequirePackage{fancyhdr} % пакет потрібний для виставлення позиції номеру сторінки
\RequirePackage{etoolbox} % пакет для прибирання висячого відступу в бібліографії та прописування умовних відстаней між заголовками

% стилі заголовків та змісту
\RequirePackage[rm,small,raggedright]{titlesec} % пакет для ручного керування стилем заголовків
\RequirePackage[titles,subfigure]{tocloft} % пакет для ручного керування стилем змісту

% пакет для коректного представлення інтернет-посилань у "Переліку посилань"
\RequirePackage{url}

% для нормального відображення _
\RequirePackage{underscore}

% пакет для нормальних пробілів після ком у десяткових дробах
\RequirePackage{icomma}

% пакет для відображення форматування вихідних кодів
\RequirePackage{listings}

% пакет для параметричних команд
\RequirePackage{xkeyval}

% пакет для гіперпосилань у змісті
\RequirePackage[hidelinks]{hyperref}

% пакет для кодів програм
\RequirePackage{verbatim}

% пакет для закресленого тексту
\RequirePackage{soul}

% 4. Основна частина

%% додаємо legacy абетку
\makeatletter

% \newcommand{\asbukLegacy}[1]{\expandafter\ukrainian@asbukDSTU\csname c@#1\endcsname}
\def\asbukLegacy#1{\expandafter\ukrainian@asbukDSTU\csname c@#1\endcsname}
\def\ukrainian@asbukDSTU#1{\ifcase#1\or
   а\or б\or в\or г\or д\or е\or ж\or
   и\or к\or л\or м\or н\or п\or р\or
   с\or т\or у\or ф\or х\or ц\or ш\or
   щ\or ю\or я\else\xpg@ill@value{#1}{ukrainian@asbukDSTU}\fi}
% \AddEnumerateCounter{\asbukLegacy}{\ukrainian@asbukDSTU}{щ}

\def\AsbukLegacy#1{\expandafter\ukrainian@AsbukDSTU\csname c@#1\endcsname}
\def\ukrainian@AsbukDSTU#1{\ifcase#1\or
   А\or Б\or В\or Г\or Д\or Е\or Ж\or
   И\or К\or Л\or М\or Н\or П\or Р\or
   С\or Т\or У\or Ф\or Х\or Ц\or Ш\or
   Щ\or Ю\or Я\else\xpg@ill@value{#1}{ukrainian@AsbukDSTU}\fi}
% \AddEnumerateCounter{\AsbukLegacy}{\ukrainian@asbukDSTU}{Щ}
\makeatother

\frenchspacing
\doublespacing % інтервал "1,5" між рядками

\newcommand{\setfontsize}[1]{\fontsize{#1pt}{#1pt}\selectfont} % команда для задавання розміру шрифта
\newcommand{\invcommas}[1]{\guillemotleft #1\guillemotright} % команда для французьких кутових лапок

% текст гіперпосилань буде того ж шрифту, що й основний текст
\urlstyle{same}

% стиль сторінки для позиції номеру сторінки
\fancypagestyle{plain}{
    \fancyhf{}
    \rhead{\thepage}
		\renewcommand{\headrulewidth}{0pt}
		\renewcommand{\footrulewidth}{0pt}
}
% команди для заборони розриву формул у небажаному місці
\binoppenalty=10000
\relpenalty=10000

% команди для заборони використання перенесень
\tolerance=1
\emergencystretch=\maxdimen
\hyphenpenalty=10000
\hbadness=10000


% команда для створення ненумерованого розділу, який тим не менше показується в змісті
\newcommand{\uchapter}[1]{\chapter*{#1}\addcontentsline{toc}{chapter}{#1}} 

% для створення вступу використаємо команду \uchapter
\newcommand{\intro}{\uchapter{Вступ}}

% для створення мути роботи використаємо команду \uchapter
\newcommand{\goal}{\uchapter{Мета роботи}}

% для створення висновків використаємо команду \uchapter
\newcommand{\conclusions}{\uchapter{Висновки}}

% для створення переліку умовних позначень використаємо команду \shortings
\newcommand{\shortings}{\uchapter{Перелік умовних позначень, скорочень і термінів}}

% хитра команда для створення додатків ??
% додамо невеличкі зміни
% хитра команда для створення додатків
\newcounter{appendnum}
\newcommand{\append}[1]{
\setcounter{chapter}{0}
\setcounter{figure}{0}
\setcounter{table}{0}
\setcounter{section}{0}
\setcounter{subsection}{0}
\titleformat{\chapter}{\centering\normalsize}{\hspace{1cm}\thechapter}{0.5em}{}
\chapter*{Додаток \AsbukLegacy{appendnum}\\#1}
\addcontentsline{toc}{chapter}{Додаток \AsbukLegacy{appendnum}\ #1}
\addvspace{-28pt}
\preto\section{%
	\ifnum\value{section}=0\addvspace{0pt}\fi%
}
\renewcommand{\thefigure}{\AsbukLegacy{appendnum}.\arabic{figure}}
\renewcommand{\thetable}{\AsbukLegacy{appendnum}.\arabic{table}}
\renewcommand{\thesection}{\AsbukLegacy{appendnum}.\arabic{section}}
\renewcommand{\thesubsection}{\AsbukLegacy{appendnum}.\arabic{section}.\arabic{subsection}}
}
% прибираємо недопустимі букви з позначення додатків
\pretocmd\append{
	\stepcounter{appendnum}
}{}{}

% будемо змінювати стилі заголовків
% спочатку --- для розділу
\titleformat{\chapter} % указуємо, що модифікуємо саме розділ
			{\centering\normalsize\MakeUppercase} % указуємо формат назви ("усі великі")
			{\hspace{1cm}\thechapter} % указуємо формат власне номера: це буде просто число, без крапки
			{0.5em} % відстань між номером і назвою
			{} % текст, що передує назві
	
% тепер --- для підрозділу
\titleformat{\section}[block] % указуємо, що модифікуємо саме підрозділ
			{\normalsize} % указуємо формат назви (жирний)
			{\hspace{1.25cm}\thesection} % указуємо формат власне номера: це буде просто число, без крапки
			{0.5em} % відстань між номером і назвою
			{} % текст, що передує назві

% тепер --- для підрозділу ще нижчого рівня
\titleformat{\subsection}[block] % указуємо, що модифікуємо саме підрозділ нижнього рівня
			{\normalsize} % указуємо формат назви (жирний)
			{\hspace{1.25cm}\thesubsection} % указуємо формат власне номера: це буде просто число, без крапки
			{0.5em} % відстань між номером і назвою
			{} % текст, що передує назві
			
% тепер задамо відступи для заголовку розділу
\titlespacing{\chapter} % указуємо, що модифікуємо саме розділ
			{0pt} % відступ зліва
			{-28pt} % відступ зверху (немає)
			{48pt} % відступ знизу (2 рядки)

% тепер задамо відступи для заголовку підрозділу			
\titlespacing{\section} % указуємо, що модифікуємо саме підрозділ
			{0pt} % відступ зліва
			{48pt} % відступ зверху (2 рядки)
			{48pt} % відступ знизу (2 рядки)
			
% тепер задамо відступи для заголовку пункта
\titlespacing{\subsection} % указуємо, що модифікуємо саме пункт
			{0pt} % відступ зліва
			{48pt} % відступ зверху (2 рядки)
			{48pt} % відступ знизу (2 рядки)

% тепер зробимо так, щоб між двома заголовками була звичайна відстань
\preto\section{%
	\ifnum\value{section}=0\addvspace{-48pt}\fi%
}

\preto\subsection{%
	\ifnum\value{subsection}=0\addvspace{-48pt}\fi%
}

% видозмінюємо зміст
\makeatletter
\renewcommand{\tableofcontents}{
	\clearpage
	\thispagestyle{plain}

	\begin{center}
	  \MakeUppercase{Зміст}
	\end{center}
	
	\addvspace{42pt}
	
	\@starttoc{toc}
}
\makeatother

% змінюємо формат нумерації формул
\renewcommand{\theequation}{\arabic{chapter}.\arabic{equation}}

% задамо оновлені списки, з правильними відступами
%% трохи змінимо
\makeatletter
\AddEnumerateCounter{\asbukLegacy}{\ukrainian@asbukDSTU}{м)}
\makeatother
% ненумерований першого рівня
\setlist[itemize,1]{label=-, partopsep=0pt, parsep=0pt, topsep=0pt, itemsep=0pt, itemindent=1.7cm, leftmargin=0pt}
\setlist[itemize,2]{label=-, partopsep=0pt, parsep=0pt, topsep=0pt, itemsep=0pt, itemindent=2.25cm, leftmargin=0pt}
% нумерований першого рівня
\setlist[enumerate,1]{label=\asbukLegacy*), partopsep=0pt, parsep=0pt, topsep=0pt, itemsep=0pt, itemindent=1.9cm, leftmargin=0pt}
\setlist[enumerate,2]{label=\arabic*), partopsep=0pt, parsep=0pt, topsep=0pt, itemsep=0pt, itemindent=2.6cm, leftmargin=0pt}


% тепер займемося змістом
% задаємо відстань між точками
\renewcommand{\cftchapdotsep}{1}
\renewcommand{\cftsecdotsep}{1}
\renewcommand{\cftsubsecdotsep}{1}

% задаємо розмір поля, що виділяється під номер сторінки
\cftsetpnumwidth{1em}

% задамо відстані між рядками в змісті
\setlength\cftbeforechapskip{0pt}

% займемося розділами
\renewcommand{\cftchapaftersnum}{} % що буде писатися після номеру розділу (нічого)
\renewcommand{\cftchapindent}{0cm} % відступ номера розділу від лівого краю
\renewcommand{\cftchapnumwidth}{1em} % розмір поля, що виділяється під номер розділу
\renewcommand{\cftchappagefont}{\mdseries} % стиль номеру сторінки (звичайний, 14pt)
\renewcommand{\cftchapfont}{\mdseries} % стиль заголовку (звичайний)
\renewcommand{\cftchapleader}{\cftdotfill{\cftchapdotsep}} % чим заповнювати проміжок від заголовку до номеру сторінки (точками)

% тепер займемося підрозділами
\renewcommand{\cftsecaftersnum}{} % що буде писатися після номеру підрозділу (нічого)
\renewcommand{\cftsecindent}{1em} % відступ номера підрозділу від лівого краю
\renewcommand{\cftsecnumwidth}{2em} % розмір поля, що виділяється під номер підрозділу
\renewcommand{\cftsecpagefont}{\mdseries} % стиль номеру сторінки (звичайний, 14pt)
\renewcommand{\cftsecfont}{\mdseries} % стиль заголовку (звичайний)
\renewcommand{\cftsecleader}{\cftdotfill{\cftsecdotsep}} % чим заповнювати проміжок від заголовку до номеру сторінки (точками)

% тепер займемося пунктами
\renewcommand{\cftsubsecaftersnum}{} % що буде писатися після номеру пункта (нічого)
\renewcommand{\cftsubsecindent}{3em} % відступ номера пункта від лівого краю
\renewcommand{\cftsubsecnumwidth}{2.5em} % розмір поля, що виділяється під номер пункта
\renewcommand{\cftsubsecpagefont}{\mdseries} % стиль номеру сторінки (звичайний, 14pt)
\renewcommand{\cftsubsecfont}{\mdseries} % стиль заголовку (звичайний)
\renewcommand{\cftsubsecleader}{\cftdotfill{\cftsubsecdotsep}} % чим заповнювати проміжок від заголовку до номеру сторінки (точками)


% заголовки таблиць, рисунків і лістингів
\DeclareCaptionLabelFormat{tablecap}{Таблиця #2} % формат за промовчанням "Табл." не влаштовує
\DeclareCaptionLabelFormat{figurecap}{Рисунок #2} % формат за промовчанням "Рис." не влаштовує
\DeclareCaptionFormat{listing}{Лістинг файлу #3} % формат за промовчанням "Listing" не влаштовує

\captionsetup[table]{margin=0pt,singlelinecheck=false, justification=justified, labelsep=endash, labelformat=tablecap, font = {stretch = 1.5}, belowskip=18pt, aboveskip=3pt} % формат для таблиць
\captionsetup[figure]{justification=centering, labelsep=endash, labelformat=figurecap, font = {stretch = 1.5}} % формат для рисунків
\captionsetup[lstlisting]{margin=0pt, format=listing, singlelinecheck=false, font = {stretch = 1.5}} % формат для лістингів

\setlength{\textfloatsep}{21pt}
\setlength{\intextsep}{21pt}

% команда, що змінює латинські літери на кирилічні в підрисунках
\renewcommand{\thesubfigure}{\asbukLegacy{subfigure}}

% нове оточення для довгих таблиць
\renewenvironment{table}[4]{
	\begingroup\centering
	\setlength{\LTpre}{-14pt}
  \setlength{\LTpost}{14pt}
  \setlength{\LTcapwidth}{0pt}
  \begin{longtable}{#1}
		\kill
		\caption{#2}\label{#3}\\
		#4
		\endfirsthead
		\kill
		\caption*{Продовження таблиці \thetable}\\
		#4
		\endhead
		\hline
		\endfoot
}
	{%
	\end{longtable}
	\endgroup	
}

% наведемо порядок із відступами в бібліографії
\patchcmd{\thebibliography}
  {\advance\leftmargin\labelsep}
  {\leftmargin=0pt\itemindent=1.9cm\advance\itemindent\labelsep}
  {}{}

% змінюємо формат номеру для переліку посилань (число + крапка)
\makeatletter
\renewcommand{\@biblabel}[1]{#1.}
\makeatother

% оновимо стандартне оточення, оскільки потрібно додати перелік посилань у зміст
\let\tempbib\thebibliography
\let\tempbibend\endthebibliography
\renewenvironment{thebibliography}{
	\renewcommand{\bibname}{ПЕРЕЛІК ПОСИЛАНЬ}% змінюємо заголовок
	\tempbib{99.}% максимально можливий номер джерела --- 99
	% далі наведемо порядок із відступами
	\setlength\partopsep{0pt}
	\setlength\parskip{0pt}
	\setlength\parsep{0pt}
	\setlength\topsep{0pt}
	\setlength\itemsep{0pt}
	\addcontentsline{toc}{chapter}{Перелік посилань}% додаємо в зміст
	}
	{
	\tempbibend
}

% додаткові команди для вставки лістингів
% стиль при \lstlisting
\lstset{style=FiraCodeStyle, basicstyle=\tiny\ttfamily, breaklines=true}
% стиль при \verbatim
\makeatletter
\renewcommand{\verbatim@font}{\ttfamily\tiny}
\makeatother
% спеціальна команда для вставки лістингів
%% додати потім лігатури
\newcommand{\listing}[2]{\singlespacing\lstinputlisting[
    language=Python,
    style=FiraCodeStyle,
    basicstyle=\tiny\ttfamily,
    breaklines=true,
    caption={#1}
]{#2}\doublespacing}
% Ця команда без підсвідки проте з підтримкою Unicode
\newcommand{\listingverbatim}[2]{
Лістинг файлу #1
\singlespacing\verbatiminput{#2}\doublespacing
}



% нові команди для анотацій
% двома мовами
\newcommand{\abstractUkr}{\chapter*{АНОТАЦІЯ}\thispagestyle{empty}\renewcommand{\arraystretch}{1.5}\setfontsize{14}}
\newcommand{\abstractEng}{\chapter*{ABSTRACT}\thispagestyle{empty}\renewcommand{\arraystretch}{1.5}\setfontsize{14}}

% нова команда для титульного аркушу
% \maketitlepage{params}, де params --- це розділені комами пари "параметр={значення}"
% StudentName --- прізвище, ініціали студента
% StudentMale --- стать студента (true, якщо чоловік, false --- якщо жінка)
% StudentGroup --- група студента
% Title --- назва документа (без лапок)
% SupervisorDegree --- науковий ступінь, учене звання керівника роботи
% SupervisorName --- прізвище, ініціали керівника роботи
\makeatletter
\define@cmdkey[Work]{Title}{StudentName}{}
\define@boolkey[Work]{Title}{StudentMale}{}
\define@cmdkey[Work]{Title}{StudentGroup}{}
\define@cmdkey[Work]{Title}{Title}{}
\define@cmdkey[Work]{Title}{SupervisorDegree}{}
\define@cmdkey[Work]{Title}{SupervisorName}{}
\newcommand{\maketitlepage}[1]{
	  \setkeys[Work]{Title}{#1}
	  \thispagestyle{empty}
	  \setlength{\parindent}{0cm}
		\begingroup\centering % центрування
			\setfontsize{14}
			\MakeUppercase{Національний технічний університет України}
			
			\MakeUppercase{\guillemotleft Київський політехнічний інститут}
			
			\MakeUppercase{імені Ігоря Сікорського\guillemotright}

			Факультет прикладної математики
			
			Кафедра прикладної математики
		
		\vfill
			
		\cmdWork@Title@Title
		
		\endgroup
		\vfill
		
		\ifWork@Title@StudentMale
			Виконав:
		\else
			Виконала:
		\fi \hfill Керівник:
		
		\ifWork@Title@StudentMale
			студент
		\else
			студентка
		\fi групи \cmdWork@Title@StudentGroup  \hfill 
		\ifundef{\cmdWork@Title@SupervisorDegree}{\relax}%
				{\cmdWork@Title@SupervisorDegree}
				
	 	\cmdWork@Title@StudentName \hfill 	\cmdWork@Title@SupervisorName
		
		\vfill
		
		\begingroup\centering
			Київ --- \the\year
			
		\endgroup
		
		\clearpage % починаємо з нової сторінки

		\setcounter{page}{2} % номер сторінки буде 2

		\pagestyle{plain}

		\setlength{\parindent}{1.25cm} % задаємо відступ першого рядка абзацу (5 знаків, або 1,25 см)
		
		% пропуск рядка до та після формули
		\setlength{\belowdisplayskip}{21pt}
		\setlength{\abovedisplayskip}{21pt}
		\setlength{\belowdisplayshortskip}{21pt}
		\setlength{\abovedisplayshortskip}{21pt}
}
\makeatother


% виправляємо помилки з апострофами в формулах 
%% ??
\makeatletter
\def\latex@@rquote{^\bgroup\prim@s} 
\let\hang@@h@ngrquote\h@ngrquote
\renewcommand{\h@ngrquote}{
	\relax\ifmmode
		\expandafter\latex@@rquote
	\else
		\expandafter\hang@@h@ngrquote
	\fi}
\makeatother
