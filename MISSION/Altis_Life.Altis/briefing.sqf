waitUntil {!isNull player && player == player};
if(player diarySubjectExists "rules")exitwith{};

player createDiarySubject ["birddown","Neue Luft-Luft Waffen"];
player createDiarySubject ["actionkey","Aktionstaste festlegen"];
player createDiarySubject ["changelog","Change Log"];
player createDiarySubject ["serverrules","Hauptregeln"];
player createDiarySubject ["policerules","Police Prozeduren/Regeln"];
player createDiarySubject ["safezones","Safezones (kein töten)"];
//player createDiarySubject ["civrules","Civilian Rules"];
player createDiarySubject ["illegalitems","Illegale Aktivitäten"];
//player createDiarySubject ["gangrules","Gang Rules"];
//player createDiarySubject ["terrorrules","Terrorism Rules"];
player createDiarySubject ["fine","Bußgeld"];
player createDiarySubject ["controls","Steuerung"];
player createDiarySubject ["saves","Was wird gespeichert"];
player createDiarySubject ["house","Haussystem"];

/*  Example
	player createDiaryRecord ["", //Container
		[
			"", //Subsection
				"
				TEXT HERE<br/><br/>
				"
		]
	];
*/
	player createDiaryRecord["birddown",
		[
			"BD MKI und MKII",
				"
					<img image='images\BLWC_small.paa' width='256' height='128'/><img image='images\police_gold.paa' width='256' height='256'/><br/><br/>
					Das Altis Police Department verkündigt stolz eine Zusammenarbeit mit der Black Lagoon Weapon Corp. (BLWC): 
					Unseren Einheiten stehen nun hochmoderne Waffen zur Bekämpfung der Kriminalität, die Luftfahrzeuge involviert, zur Verfügung!<br/><br/>
					<t size='1.2'>--- BD 'Bird Down' Mark I 'Fuel Killer' ---<t/><br/>
					Diese Hochpräzisionswaffe arbeitet auf Basis von Hochleistungspolymerisationsstoffen, die mit Hilfe eines computergestützten und präzisen Schusses in den Tank des Zielluftfahrzeuges befördert werden. Diese Stoffe führen dazu, dass der Größte Teil des Tankinhalts in einer Gelartigen Masse gebunden wird und somit nicht mehr als Treibstoff benutzt werden kann.<br/> Diese Methode ist normalerweise nicht tödlich.<br/><br/>
					Hinweis: Da die Waffe an der Unterseite des Luftfahrzeuges untergebracht wird, um 360 Grad Rundumsicht auf der Horizontalen zu ermöglichen, muss der angreifende Helikopter höher oder auf gleicher Höhe wie das Ziel sein!<br/><br/><br/>
					<t size='1.2'>--- BD 'Bird Down' Mark II 'Electrostatic' ---<t/>
					Die BD-MKII ist die modifizierte Fassung der BD-MKI, optimiert für das sofortige Ausschalten des Zielluftfahrzeugs. Ähnlich wie bei der BD-MKI wird ein hochmodernes Spezialgeschoss auf das Ziel abgefeuert, das bei dieser Waffe das Ziel jedoch durch ein Hochleistungs-Micro-EMP-Modul vollständig lahmlegt, indem alle elektronischen Komponenten unwiederruflich zerstört werden.<br/>
					Aufgrund des deutlich höheren Gewichts der Micro-EMP-Geschosse muss der Angreifer deutlich näher an dem Zielfahrzeug sein und länger warten, bis die Zielkalibrierung abgeschlossen ist.<br/><br/>
				"
		]
	];

	player createDiaryRecord["actionkey",
		[
			"Aktionstaste festlegen",
				"
					Für Aktionen wie Aufheben, Spieler fesseln oder Fahrzeuge abschleppen musst du nun die Aktionstaste 10 drücken.<br/>
					Festlegen der Taste: Konfiguration > Steuerung > Individuelle Steurung > Aktionstaste 10<br/>
					Empfohlen wird Strg links, du kannst aber auch eine andere Taste benutzen<br/><br/>
				"
		]
	];
	
	player createDiaryRecord["changelog",
		[
			"Changelog",
				"
					Unser Server wird die ganze Zeit weiterentwickelt, um euer Spielerlebnis zu verbessern:<br/><br/>
					
					+ Es wurde ein Schießplatz hinzugefügt, an dem jeder trainieren kann.<br/>
					+ Cops können nun auch Autos in Zivilfarben kaufen<br/>
					+ Weitere Verbesserungen beim Balancing<br/>
					+ Du kannst eingepackte First-Aid-Kits kaufen, die du sicher im Haus oder Auto verstauen kannst.<br/>
					+ Euer Inventar (Z-Menü) wird gespeichert<br/>
					+ Verbessertes Balancing <br/>
					  - Alle Werte neu ausgerechnet.<br/>
					+ Eisenmine nun oben links.<br/>
					+ Mehr Gefängnisse, an denen Polizisten Leute verhaften können.<br/>
					+ Wenn du Drogen verkaufst, bekommst du Drogengeld, das du erst waschen lassen musst.<br/>
					  - Du findest die Geldwäscher auf der Karte.<br/>
					  - Der Geldwäscher gibt Rabatt, je mehr Geld du von ihm waschen lässt.<br/>
					+ Rebellen können nun in Rebellenposten respawnen.<br/>
					+ Bei Zivilisten werden auch Waffen und Ausrüstung gespeichert.<br/>
					+ Du kannst eingepackte Repairkits kaufen, die ins Z-Inventar und daher sicher im Auto verstaut werden können.<br/>
					  - Benutze das Item, um ein Repairkit/Toolkit zu bekommen.<br/>
					+ Neu ausgerechneter Lohn<br/>
					+ Hafen verändert. Boote können nun auch ausgeparkt werden.<br/>
					+ Lampen und Schilder eingefügt.<br/>
					+ Verschönerter Marktplatz.<br/>
					+ Verbesserte Positionen von Drogendealern, etc.<br/>
					+ uvm z.B. Bugfixes<br/>
				"
		]
	];	

		player createDiaryRecord ["serverrules",
		[
			"Exploits", 
				"
					Die Folgenden Dinge sind Exploits und werden mit Ban bestraft:
					1. Auf unnormalem Weg aus dem Gefängnis frei kommen.
					2. Suizid oder disconnecten um Roleplay zu entgehen (z.B.: in getasert, Feuergefecht, gefesselt, etc.) Falls der Serverlog Auffälligkeiten zeigt wirst du gebannt.
					3. Duplizieren von Items oder Geld. Wenn dir jemand einen auffällig hohen Geldbetrag sendet melde es, sonst begehst du die Gefahr selbst gebannt zu werden.
					4. Benutzen von gecheateten Items. Falls ein Hacker Items spawnt und du diese benutzt kannst du gebannt werden. Melde dies umgehend bei einem Admin und bleib von den Items fern.
					5. Das benutzen von Bugs die dir ein Vorteil verschaffen ist untersagt.
				"
		]
	];
	
	player createDiaryRecord["safezones",
		[
			"Safezones",
				"
					Bei Sprengungen (auch Fahrzeug explodieren), ausrauben, oder töten in diesen Zonen wird der Spieler mit Kick/Ban bestraft.<br/><br/>
					
					Fahrzeugspawns (Laden und Garage)<br/>
					Waffenläden<br/>
					Bankautomaten<br/>
					Polizei HQs<br/>
					Schießplatz<br/>
					Donator Shop<br/><br/>
				"
		]
	];
					
	
	player createDiaryRecord ["serverrules",
		[
			"Banbare Aktivitäten", 
				"
					Einzige und letzte Warung.<br/><br/>
					
					1. Hacken<br/>
					2. Cheaten<br/>
					3. Exploiten (siehe Exploits)<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Polizei Interaktion", 
				"
					Die folgenden Aktivitäten sind Straftaten:<br/><br/>
					
					1. Zivilisten können dafür bestarft werden wenn sie bei Polizisten in die Fahrzeuge und Rucksäcke schauen.<br/>
					2. Zivilisten können dafaür bestraft werden wenn sie Polizisten verfolgen.<br/>
					3. Zivilisten oder Rebellen die Polizisten ohne RP Grund töten fallen unter RDM (siehe RDM Sektion).<br/>
					4. Das verfolgen oder beleidigen von Polizisten kann lange Gefängnisstrafen zur Folge haben.<br/>
					5. Das mutwillige blockieren von Polizisten die ihrer Arbeit nachgehen wird bestraft.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Boote", 
				"
				Die folgenden Aktivitäten können mit mit Kick/Ban bestraft werden:<br/><br/>
				
				1. Das wiederholte hereindrücken von Booten ohne Genehmigung vom Besitzer.<br/>
				2. Das hereindrücken von Booten wobei Spieler sterben oder verletzt werden.<br/>
				3. Das überfahren von Schwimmern oder Tauchern.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Luftfahrt", 
				"
				Die folgende Aktivität kann mit einem Kick/Ban bestraft werden:<br/><br/>
				
				1. Mutwilliges rammen mit einem Helikopter in Helikopter, Autos, Häuser kann mit einem Ban bestraft werden.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Fahrzeuge", 
				"
				Die folgenden Aktivitäten können mit mit Kick/Ban bestraft werden:<br/><br/>
				
				1. Das mutwillige überfahren von Spielern(VRDM).<br/>
				2. Gezielt vor ein fahrendes Fahrzeug werfen um verletzt oder getötet zu werden.<br/>
				3. Das mutwillige rammen von anderen Fahrzeugen um Explosionen zu verursachen.<br/>
				4. Das stehlen eines Fahrzeugs nur um es zu zerstören.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Kommunikationsregeln", 
				"
				Die folgenden Aktivitäten können mit Kick/Ban bestraft werden:<br/><br/>
				
				1. Das abspielen vom Musik oder spamen im Side Chat.<br/>
				2. Das spamen in jedem Chat Channel, auch Teamspeak.<br/>
				3. Polizisten dürfen im Teamspeak nur kurz in Zivilisten Channels gehen. Zivilisten dürfen sich auch nur kurz in Polizei Channels aufhalten.<br/>
				4. Das durchgeben von Polizeiinformationen während man in Polizei Channels ist.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Random Deathmatching (RDM)", 
				"
				Random Deathmatching kann mit Kick/Ban bestraft werden:<br/><br/>
				
				1. Jemanden ohne RP-Hintergrund töten ist RDM.<br/>
				2. Zu deklarieren das man ein Rebell ist, ist kein RP-Hintergrund zu töten.<br/>
				3. Falls du im Kreuzfeuer getetötet wirst ist das kein RDM.<br/>
				4. Jemanden zu töten in dem Versuch, dich selbst oder andere Persenen zu schützen ist kein RDM.<br/><br/>				
				"
		]
	];
	
// Police Section
	player createDiaryRecord ["policerules",
		[
			"Krisenüberwinding",
				"
				Die Krisenüberwindung muss vom ranghöchsten Polizist übernommen werden.(Bombendrohung)<br/><br/>
				"
		]
	];
	player createDiaryRecord ["policerules",
		[
			"Die Staatsbank",
				"
				1. Die Staatsbank ist ein illegales Areal für Zivilisten.
				2. Helikopter die über der Staatsbank fliegen haben diese nach Aufforderung zu verlassen, ansonsten werden sie außer Gefecht gesetzt.<br/>
				2. Falls die Staatsbank überfallen wird, müssen alle verfügbaren Polizeikräfte den Überfall verhindern.<br/>
				3. Tödliche Gewalt kann angewandt werden, je nach Bedingung sollten die Räuber aber verhaftet werden.<br/>
				4. Die Polizei sollte nicht blind um sich schießen, da Unbeteiligte verletzt werden könnten.<br/>
				5. Jeder Zivlist der in irgendeiner Weiße die Räuber unterstützt wird als Komplize angesehen.<br/><br/>
				"
		]
	];
	player createDiaryRecord ["policerules",
		[
			"Helikopterlandungen",
				"
				1. Helikopter dürfen in Städten nur auf diesen Punkten Landen.<br/>
				Kavala: Hafen (altes Polizeirevier).<br/>
				Athira: Sportfeld.<br/>
				Pyrgos: Felder am Stadtrand<br/>
				Sofia: Felder am Stadtrand<br/>
				Dörfer: beliebige Auswahl<br/><br/>
				
				2. Helikopter sollten nicht auf der Straße landen.<br/>
				3. Die Polizei darf Landungen verbieten.<br/>
				4. Helikopter dürfen über Städten nicht niedriger als 150m fliegen.<br/>
				5. Helikopter dürfen über Städten nicht still schweben.<br/><br/>

				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Illegale Bereiche", 
				"
				1. Betrete keinen illegalen Bereich ohne das er Teil einer Razzia ist.<br/>
				2. Falls du Jemanden in einen illegalen Bereich verfolgst solltest du um Verstärkung bitten.<br/>
				3. Unter besonderen Umständen dürfen Polizisten in illegalen Bereichen campen.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Patrouillie", 
				"
				1. Die Polizei sollte die Straßen und Städte/Dörfer nach verlassenen Fahrzeugen und krimineller Aktivität durchsuchen.<br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Checkpoints", 
				"
				Polizisten sollten Checkpoints in strategischen Gebieten errichten um illegale Aktivitäten zu unterbinden und um die Sicherheit auf den Straßen zu gewährleisten.<br/><br/>
				
				1. Ein Checkpoint darf nicht weniger als 500m von einem illegalen Bereich entfernt sein.<br/>
				2. Checkpoints sollten nur auf Straßen errichtet werden.<br/>
				3. Checkpoints dürfen nicht auf der Karte markiert werden.<br/><br/>


				Checkpoint Prozedur:<br/>
				1. Der Fahrer sollte das Fahrzeug in einer sicheren Distanz anhalten und den Motor ausschalten.<br/>
				2. Frage den Fahrer nach weiteren Passagieren und Waffen.<br/>
				3. Sag dem Fahrer sie sollen aussteigen und die Waffen senken(falls vorhanden), gieb ihnen hierbei eine vernünftige Zeit zum reagieren.<br/>
				4. Frag sie woher sie kommen und wohin sie fahren.<br/>
				5. Frag sie ob du sie durchsuchen darfst.<br/>
				6. Falls sie es erlauben fassel und durchsuche sie.<br/>
				7. Nachdem die Durchsuchung getan ist erlaube ihnen wieder ins Fahrzeug steigen zu können und wegzufahren.<br/>
				8. Falls etwas illegales gefunden wird müssen Tickets oder Gefängnisstrafen erteilt werden (abhängig vom Delikt).<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Fahrzeuge", 
				"
				1. Fahrzeuge die vernüntig geparkt wurden sollten in Ruhe gelassen werden.<br/>
				2. Fahrzeuge die verlassen, zerstört und ohne Fahrer sind können beschlagnahmt werden.<br/>
				3. Boote sollten vernünftig in der Küste oder im Hafen geparkt werden.<br/>
				4. Beschlagnahmen ist ein essentieller Bestandteil eines Polizisten, es hält den Server sauber und weniger laggy.<br/>
				6. Im Zweifelsfall solltest du den Besitzer benachrichtigen.<br/>
				7. Bewaffnete Polizeifahrzeuge sollten nur in Krisensituationen genutzt werden.<br/><br/>
				"
		]
	];

	player createDiaryRecord ["policerules",
		[
			"Geschwindigkeiten", 
				"
				Die folgenden Geschwindigkeitsregelungen sind einzuhalten und von der Polizei su überwachen:<br/><br/>
				
				In Städten darf nicht schneller als 60km/h gefahren werden.<br/>
				Außerhalb von Städten gibt es keine Geschwindigkeitsbergrenzungen<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Stadt-Patrouillie", 
				"
				1. Polizisten sollten immer in Kavala, Athira, Pyrgos und Sofia patrouillieren.<br/>
				2. Polizei HQ's sind illegal für Zivilisten, nicht aber der Aufenthalt in der Nähe von Polizei HQ's.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Gefängnisstrafe und Tickets",
				"
				Gefängnisstrafen sollten nur an Kriminelle vergeben werden die sich selbst oder Andere gefährden.<br/><br/>

				1. Du sollst niemanden inhaftieren der bereits ein Ticket für die Straftat bezahlt hat.<br/>
				2. Du musst dem Kriminellen erklären warum er inhaftiert wird.<br/>
				3. Falls ein Zivilist gesucht wird solltest du ihn nicht töten sondern festnehmen, es sei denn es sind Umstände gegeben in denen der gebrauch von tödlicher Gewalt unumgehbar ist.<br/><br/>


				Tickets sollten nur an Kriminelle vergeben werden die ein Gesetz verletzt haben.<br/><br/>

				1. Die Weigerung ein Ticket zu bezahlen hat eine Gefängnisstrafe zur Folge.<br/>
				2. Das ausstellen eines Tickets das nicht in die Norm des Bußgeldkatalogs fällt hat die Entlassung aus dem Polizeidienst zur Folge.<br/><br/>
				
				Die Höhe der Tickets können im Bußgeldkatalog nachgeschlagen werden.<br/><br/>
				"
		]
	];
		
	player createDiaryRecord ["policerules",
		[
			"Waffen", 
				"
				Ein Polizist darf niemals einen Zivilist mit Waffen versorgen. Tut er es doch wird er aus dem Polizeidienst entlassen oder schlimmeres.<br/><br/>

				Legale Waffen für Zivilisten die einen Waffenschein besitzen sind:<br/><br/>
				
				1. P07<br/>
				2. Rook<br/>
				3. ACP-C2<br/>
				4. Zubr<br/>
				5. PDW2000<br/>
				6. Sting<br/>
				7. Vermin<br/><br/>

				Alle anderen Waffen(auch P07 + Schalldämpfer(Polizeiwaffe)) sind illegal.<br/><br/>

				1. Zivilisten sollten ihre Waffen innerhalb von Städten wegstecken oder ein Fernglas bzw. Entfernungsmesser in die Hand nehmen.<br/>
				2. Zivilisten sollten ihre Waffen in außerhalb von Städten in der Nähe von Polizisten runterhalten(2x Strg).<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Nutzung von nicht tödlicher Gewalt",
				"
				Die Taser-Pistole und das Taser-Gewehr sind die einzigen Formen von nicht tödlicher Gewalt.<br/><br/>

				1. Taser sollten genutzt werden um Zivilisten außer Gefecht zu setzen und zu verhaften.<br/>
				2. Sinnloses herumgeschieße mit dem Taser kann eine Suspension zur Folge haben.<br/>
				3. Benutzen sie den Taser nicht nur um ihren Willen durchzusetzen sondern beachten sie die geltenden Gesetze.<br/><br/>
				"
		]
	];

	player createDiaryRecord ["policerules",
		[
			"Razzien/Campen",
				"
				Bei Razzien betritt die Polizei Bereiche in denen sie kriminelle Aktivitäten vermutet.<br/><br/>

				1. Razzien müssen von einem hochrangigen Polizeimitglied durchgeführt werden.<br/>
				2. Alle Zivilisten im Bereich der Razzia werden gefesselt und durchsucht. Wenn nichts illegales gefunden wurde musst du sie frei lassen.<br/>
				3. Wenn etwas illegales gefunden wurde wird mit der üblichen Prozedur(Gefängnisstrafe oder Ticket) fortgefahren.<br/>
				4. Nachdem der Bereich sicher ist müssen alle Beamten den Ort verlassen.<br/>

				Beim Camping betritt die Polizei einen Bereich und wartet dort auf Kriminelle.<br/><br/>

				1. Polizisten dürfen in der Staatsbank campen wenn sie einen Überfall vermuten.<br/>
				2. Polizisten dürfen in illegalen Bereichen campen.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Kommandokette",
				"
				Der Chef der Polizei ist Monstaub. Der Polizist mit dem höchsten Rang der online ist vergibt die Befehle. Die Verweigerung eines Befehls kann eine Degradierung, Suspendierung oder Entlassung zur Folge haben.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Nutzung von tödlicher Gewalt",
				"
				1. Die Nutzung von tödlicher gewalt ist nur erlaubt wenn Leben in Gefahr sind.<br/>
				2. Sinnloses herumgeschieße mit scharfer Munition kann eine Entlassung zur Folge haben.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Teamspeak Regel",
				"
				1. Alle Polizisten müssen auf unserem Teamspeak in den Polizei Channels sein. Wenn dies nicht der Fall ist kann es eine Degradierung, Suspendierung oder Entlassung zur Folge haben. <br/><br/>
				"
		]
	];
	
	
	
// Illegal Items Section
	player createDiaryRecord ["illegalitems",
		[
			"Rebellen Regeln",
				"
				Ein Rebel erhebt sich mit Waffengewalt gegen die Regierung, in diesem Fall gegen die Polizei. Trotzdem gelten für diese alle anderen RP-Regeln.<br/><br/>
				
				1. Wiederstand ist keine Entschuldigung für Random Deathmatching.<br/>
				2. Eine plausible RP Handlung soll hinter jeder Attacke stecken.<br/><br/>
				"
		]
	];
	player createDiaryRecord ["illegalitems",
		[
			"Gang Regeln",
				"
				1. Mitglied einer Gang zu sein ist nicht illegal.<br/>
				2. Sich ein Ganggebiet aufzuhalten ist nicht illegal, außer wenn man dort illegale Aktivitäten praktiziert.<br/>
				3. Gangs können Ganggebiete halten und kontrollieren. Andere Gangs können diese einnehemen.<br/>
				4. Um einer anderen Gang den Krieg zu erklären muss der eine Leader dem Anderem global den Krieg erklären. Außerdem müssen die Mitglieder beider Gangs genannt werden.<br/>
				5. Gangs dürfen keine unbeteiligten oder unbewaffneten Zivilisten töten.<br/><br/>
				"
		]
	];
	player createDiaryRecord ["illegalitems",
		[
			"Illegale Fahrzeuge",
				"
				Illegale Fahrzeuge sind:<br/><br/>

				1. alle Polizeifahrzeuge<br/>
				2. alle gepanzerten Fahrzeuge<br/>
				3. alle bewaffneten Fahrzeuge<br/><br/>
				"
		]
	];
	player createDiaryRecord ["illegalitems",
		[
			"Illegale Waffen",
				"
				Illegale Waffen sind:<br/><br/>

				1. alle Polizeiwaffen (MX Series, P07 + Schalldämpfer)<br/>
				2. Katiba Serien<br/>
				3. TRG Serien<br/>
				4. Mk.20 Serien<br/>
				5. Mk.18 ABR<br/>
				6. SDAR<br/>
				7. Rahim
				8. Granaten<br/>
				9. Rucksackladungen<br/><br/>
				"
		]
	];
	player createDiaryRecord ["illegalitems",
		[
			"Illegale Items",
				"
				Illegale Items sind:<br/><br/>
				
				1. Schildkröten<br/>
				2. unverarbeites Kokain und verarbeitetes Kokain<br/>
				3. Schlafmohn sowie Heroin<br/>
				4. Marihuana und Cannabis<br/>
				5. LSD<br/>
				6. Handschellen<br/>
				6. illegales Geld<br/><br/>
				
				Der Besitz dieser Items und der Gebrauch sind strafbar.<br/><br/>
				"
		]
	];
	player createDiaryRecord["fine",
		[
			"Zivilisten:",
			"
				Waffen:<br/>
				- Mit gezogener Waffe durch die Stadt laufen: 1.000$<br/>
				- Besitz von verbotenen Waffen: Beschlagnahmung<br/>
				- Schusswaffengebrauch innerhalb von Städten: 8.000$<br/>
				- Führen eines gestohlenen Polizei Fahrzeuges: 80.000$<br/><br/>
				
				Personen & Gegenstände:<br/>
				- Verursachen von Sachschäden: 5.000$<br/>
				- Sich als Polizist aus geben: 12.000$<br/>
				- Anschießen von Personen: 50.000$<br/>
				- Überfall auf Personen:: 65.000$<br/>
				- Foltern von Personen: 80.000 + Inhaftierung 8Min<br/>
				- Mord einer Person: 100.000 + Inhaftierung 30Min<br/><br/>
				
				Schwere Straftaten:<br/>
				- Beteiligung illegaler Straßensperren: 10.000$<br/>
				- Fahren von Illegale Fahrzeuge: 50.000$+Beschlagnahmung<br/>
				- Geiselnahme je Teilnehmer: 125.000$ pro Geisel<br/>
				- Bankraub (erfolglos): 250.000$ je Teilnehmer<br/>
				- Bankraub (erfolgreich) Beute + 350.000$<br/><br/>
				
				Drogen:<br/>
				- Besitz von Haschisch jeder Art: Inhaftierung 10Min<br/>
				- Besitz von Kokain jeder Art: Inhaftierung 15Min<br/>
				- Besitz von Heroin jeder Art: Inhaftierung 20Min<br/>
				- Besitz von schwarz Geld: ½ vom Schwarzgeld als Strafe<br/>
				- Besitz von Schildkröten: Inhaftierung 10Min<br/>
				- Besitz von LSD: Inhaftierung 10Min<br/><br/>
			"
		]
	];
	player createDiaryRecord["fine",
		[
			"Wasserfahrzeuge:",
			"
				- Boote grundlos schieben: 3.000$<br/>
				- Schwimmende Leute behindern: 8.000$<br/><br/>
			"
		]
	];
	player createDiaryRecord["fine",
		[
			"Luftverkehrs Ordnung (LuftVO):",
			"
				- Versuchte Landung in einer Flugverbotszone: 75.000$<br/>
				- Landen in einer Flugverbotszone: 150.000$ + Beschlagnahmung<br/>
				- Landen auf einer Straße (ohne Aufforderung) 10.000$<br/>
				- Fliegen ohne Kollisionslichter: 6000$<br/>
				- Absichtliche Kollision: 75.000$<br/><br/>
			"
		]
	];
	player createDiaryRecord["fine",
		[
			"Straßenverkehrs-Ordnung (StVO):",
			"
				Ordnungswidrigkeiten:<br/>
				- Falsches abstellen vom Fahrzeug: 250$<br/>
				- Fahren ohne Licht bei Dunkelheit oder Dämmerung: 550$<br/>
				- Fahren auf der falschen Straßenseite: 1000$<br/>
				- Fahren abseits der Straße 1500$<br/>
				- Missachtung der Straßenschilder: 750$<br/>
				- Missachtung Rechts vor Links: 750$<br/><br/>
				
				Straftaten:<br/>
				- Verursachen eines Unfalles: 5.000$<br/>
				- Unfallflucht: 10.000$<br/>
				- Anfahren von Personen: 2.500$<br/>
				- Überfahren von Personen: 25.000$<br/>
				
				Geschwindigkeitsübertrettung nur 50Zonen:<br/>
				- 10-20 km/h zu Schnell 1.200$ (gefahren: 60-70km/h)<br/>
				- 21-30 km/h zu Schnell 2.500$ (gefahren: 71-80km/h)<br/>
				- 31-50 km/h zu schnell 15.000$ (gefahren: 81-100kmh)<br/>
				- 51+km/h  zu schnell 30.000$ (gefahren: 101-Max km/h)<br/><br/>
			"
		]
	];
	player createDiaryRecord["fine",
		[
			"Polizeibeamten:",
			"
				- Missachtung polizeilicher Anordnung: 500$<br/>
				- Wiederholte Missachtung Anordnung: 2.000 + Inhaftierung 3min<br/>
				- Betreten von Polizei Gelände: 2.000$<br/>
				- Belästigung eines Polizeibeamten: 2.500$<br/>
				- Beamtenbeleidigung (Spielerisch): 5.000$<br/>
				- Widerstand gegen die Staatsgewalt: 20.000$<br/>
				- Beschuss von einen Polizeibeamten: 80.000$<br/>
				- Töten eines Polizeibeamten: 150.000+Inhaftierung 30min<br/>
				- Mitführen von Schwarzgeld: Konfiszierung<br/><br/>
			"
		]
	];
	player createDiaryRecord["fine",
		[
			"Lizenzen & Scheine:",
			"
				- PKW Führerschein: 10.000$<br/>
				- LKW Führerschein:  45.000$<br/>
				- Bootsschein: 25.000$<br/>
				- Flugschein: 250.0000<br/>
				- Waffenbesitz ohne Lizenz: 100.000$<br/><br/>
			"
		]
	];
	player createDiaryRecord["fine",
		[
			"Diebstahl:",
			"
				- Versuchter Taschendiebstahl: 1.500$<br/>
				- Versuchter Diebstahl zivilen Fahrzeuges: 3.500$ je Versuch<br/>
				- Diebstahl zivilen Fahrzeuges: 10.000$<br/>
				- Versuchter Diebstahl Polizei Fahrzeuges: 10.000$ je Versuch<br/>
				- Diebstahl Polizei Fahrzeuges: 20.000$<br/>
				- Führen eines gestohlenen zivilen Fahrzeuges: 35.000$<br/>
				- Führen eines gestohlenen Polizei Fahrzeuges: 80.000$<br/><br/>
			"
		]
	];
	player createDiaryRecord ["controls",
		[
			"",
				"
				Y: öffnet Spielermeü<br/>
				U: aufschließen und zuschließen von Autos<br/>
				F: Polizeisirene (nur Polizist)<br/>
				T: Fahrzeugkofferraum<br/>
				Linkes Shift + R: fesseln (nur Polizist)<br/>
				Linkes Shift + G: umschlagen (nur Zivilist, um auszurauben)<br/>
				Linkes Shift + L: aktiviert Blaulicht (nur Polizist)<br/><br/>
				"
		]
	];
	
	player createDiaryRecord["saves",
		[
			"Was genau gespeichert wird:",
				"
					Auf unserem Server werden i.d.R. alle Items gespeichert. Das heißt:<br/><br/>
					
					Gear von Polizisten (funktioniert i.d.R.)<br/>
					Gear von Zivilisten (funktioniert i.d.R.)<br/>
					Inventar (Z-Menü) - Unbedingt synchronisieren!<br/>
					Hausinventar (Synchronisiert, wenn man auf 'Schließen' drückt)<br/>
					Geld, das zum Geldwäscher gebracht wurde<br/>
					Fahrzeuginventar/Trunk/Kofferraum (KEINE ILLEGALEN ITEMS wegen Balancing!!!) - Synchronisiert, wenn man auf 'Schließen' drückt<br/><br/>
				"
		]
	];
	
	player createDiaryRecord["house",
		[
			"Haussystem: Vorteile",
				"
					Du kannst hier ein Haus kaufen, wenn du dir vorher eine Eigentumsurkunde beim Lizenzhändler besorgt hast.
					Suche nach einem Schild mit dem Haussysmbol und öffne im Scroll-Menü die Haussteuerung.<br/><br/><br/>
					
					
					Ein eigenes Haus bringt dir folgende Vorteile:<br/><br/>
					
					* Du kannst in deinem Haus respawnen.<br/>
					* Du kannst beliebige virtuelle Items (vom Z-Inventar) in deinem Haus speichern. Es fasst standardmäßig 100 Gewichtsplätze.<br/>
					* Wenn du mehr Inventarplatz für dein Haus willst, dann kaufe Möbel im Möbelhaus und benutze sie in der Nähe deines Hauses.<br/>
					* Niemand weiß wo du wohnst, außer er beobachtet dich oder du erzählst es ihm.<br/>
					* Direkter Zugriff auf die Autogarage über das Hausmenü.<br/>
					<br/><br/>
					Aber Vorsicht! Die Polizei kann das Haus durchsuchen!
				"
		]
	];