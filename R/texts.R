# ==============================================================================
# Project: Monty Hall Paradox - Simulator & Statistical Analysis
# Author: Rafał Gardian
# Date: March 2026
# Component: Text Resources & Internationalization (i18n)
# Description: Centralized repository for UI strings and educational content.
# ==============================================================================

# 1. INTERNATIONALIZATION (i18n) -----------------------------------------------
# Multilingual dictionary for UI strings.
# This centralizes all text, making ui.R and server.R cleaner.
i18n <- list(
  "en" = list(
    title = "Let's Make a Deal! (Monty Hall problem)",
    tab_game = "Game",
    tab_science = "History & Explanation",
    tab_fair = "Fairness",
    tab_how = "How to play?",
    settings = "Settings",
    lang = "Language",
    zonk_select = "Zonk Character:",
    zonk_cat = "Cat",
    zonk_goat = "Goat",
    author = "Author: © Rafał Gardian",
    legal_title = "Legal information",
    legal_body = HTML(
      paste(
        "All rights reserved.<br>",
        "It is forbidden to modify, copy the source code, or use the application for commercial purposes without the author's consent.<br>",
        "Sharing a public link to the application for non-commercial purposes is allowed (and even encouraged!)."
      )
    ),
    info_init = "Step 1: Choose a door!",
    info_final = "Step 2: The presenter opened one door. Decision! Switch the door or stay with your previous choice?",
    info_win = "Round ended: YOU WIN! Congratulations!",
    info_loss = "Round ended: loss...",
    play_again = "Play again",
    stats_title = "Overall Statistics",
    strat_stay = "Stay!",
    strat_switch = "Switch!",
    plot_title = "Strategy Effectiveness",
    y_label = "% wins",
    door = "Door",
    sim_label = "Simulation:",
    reset_stats = "Reset Stats",
    adv_settings = "Advanced Options (Statistics)",
    method_select = "CI Method:",
    conf_level = "Confidence Level:",
    table_strat = "Strategy",
    table_n = "Trials",
    table_pct = "Wins %",
    table_ci = "Confidence Interval",
    stat_win_abbr = "W",
    stat_loss_abbr = "L",
    total_label = "Total games",
    theory_label = "Theory",
    mute_label = "Mute sounds",
    fair_title = "Prize Distribution (Randomness check)",
    fair_desc = "Was the game really programmed so that prizes appear in doors 1, 2, and 3 with the same probability: 1/3? You can check it here.",
    fair_extra = "The chart below shows the frequency of the main prize for each door. According to the Law of Large Numbers, the distribution stabilizes around 33.3% after many trials.",
    fair_extra2 = "Global statistics from all application users:",
    intro_text = "Welcome to the Monty Hall game! Choose one of three doors. One hides a car, the others hide Zonks. Probability theory says it's worth switching!",
    intro_options_label = "Options:",
    intro_adv_info = "You can change settings at any time using the gear icon in the top right corner.",
    show_adv = "Show advanced statistics options",
    how_to_text = "1. Choose a door. 2. The host opens a Zonk door. 3. Decide: stay or switch.",
    global_y_label = "Occurrences (N)",
    global_title = "Global System Reliability (All Players)"
  ),
  "pl" = list(
    title = "Idź na całość! (Paradoks Monty'ego Halla)",
    tab_game = "Gra",
    tab_science = "Historia i wyjaśnienie paradoksu",
    tab_fair = "Rzetelność",
    tab_how = "Jak grać?",
    settings = "Ustawienia",
    lang = "Język",
    zonk_select = "Postać Zonka:",
    zonk_cat = "Kot",
    zonk_goat = "Koza",
    author = "Author: © Rafał Gardian",
    legal_title = "Informacje prawne",
    legal_body = HTML(
      paste(
        "Wszelkie prawa zastrzeżone.<br>",
        "Zabrania się modyfikowania, kopiowania kodu źródłowego oraz wykorzystywania aplikacji w celach komercyjnych bez zgody autora.<br>",
        "Dozwolone (a nawet mile widziane!) jest udostępnianie publicznego linku do aplikacji, w celach inne niż komercyjne."
      )
    ),
    info_init = "Krok 1: Wybierz bramkę!",
    info_final = "Krok 2: Prowadzący otworzył jedną z bramek. Decyzja! Zmieniasz bramkę czy zostajesz przy wcześniejszym wyborze?",
    info_win = "Runda zakończona: WYGRANA! Gratuluję!",
    info_loss = "Runda zakończona: porażka...",
    play_again = "Zagraj ponownie",
    stats_title = "Statystyki zbiorcze",
    strat_stay = "Zostaję!",
    strat_switch = "Zmieniam!",
    plot_title = "Skuteczność strategii",
    y_label = "% wygranych",
    door = "Bramka",
    sim_label = "Symulacja:",
    reset_stats = "Resetuj statystyki",
    adv_settings = "Ustawienia zaawansowane (Statystyka)",
    method_select = "Metoda przedziału ufności:",
    conf_level = "Poziom ufności:",
    table_strat = "Strategia",
    table_n = "Próby",
    table_pct = "Wygrane %",
    table_ci = "Przedział ufności",
    stat_win_abbr = "W",
    stat_loss_abbr = "P",
    total_label = "Suma gier",
    theory_label = "Teoria",
    mute_label = "Wycisz dźwięki",
    fair_title = "Rozkład nagród (Test losowości dla cierpliwych)",
    fair_desc = "Czy rzeczywiście gra została zaprogramowana tak, że nagrody pojawiają się w bramkach 1, 2, 3 z tym samym prawdopodobieństwem: 1/3? Możesz skontrolować to w tej zakładce, choć musisz być cierpliwym...",
    fair_extra = "Poniższy wykres i tabela (wyświetlający się po pierwszej naszej grze podczas sesji) prezentują częstotliwość pojawiania się nagrody głównej za poszczególnymi bramkami. Zgodnie z prawem wielkich liczb, dopiero po długiej serii prób (minimum 1000) rozkład stabilizuje się w okolicach 33,3% dla każdej z bramek.",
    fair_extra2 = "A tutaj możesz zobaczyć analogiczny wykres dotyczący wszystkich gier (o ile dana seria gier zakończyła się poprawnym zamknięciem programu) użykowników aplikacji, nie tylko Twoich:",
    intro_text = "Witaj w grze Monty Hall! Wybierz jedną z trzech bramek. Za jedną jest samochód, za pozostałymi Zonki. Po Twoim wyborze prowadzący odsłoni jedną bramkę z Zonkiem i zapyta, czy chcesz zmienić decyzję. Rachunek prawdopodobieństwa mówi, że warto! Ale czy na pewno? Sprawdź to sam!",
    intro_options_label = "Opcje:",
    intro_adv_info = "Opcje, w tym zmianę języka, możesz edytować w dowolnym momencie gry, korzystając z ikony koła zębatego w prawym górnym rogu.",
    show_adv = "Pokaż opcje zaawansowane statystyki",
    how_to_text = "1. Wybierz bramkę. 2. Prowadzący otworzy inną bramkę z Zonkiem. 3. Podejmij decyzję: zostajesz czy zmieniasz. Wykresy poniżej pokazują skuteczność Twojej strategii oraz statystyczne przedziały ufności.",
    global_y_label = "Liczba wystąpień (N)",
    global_title = "Rzetelność systemu globalnie (Wszyscy gracze)"
  ),
  "de" = list(
    title = "Geh aufs Ganze! (Monty-Hall-Problem)",
    tab_game = "Spiel",
    tab_science = "Geschichte und Erklärung des Paradoxons",
    tab_fair = "Fairness",
    tab_how = "Wie spielt man?",
    settings = "Einstellungen",
    lang = "Sprache",
    zonk_select = "Zonk-Figur:",
    zonk_cat = "Katze",
    zonk_goat = "Ziege",
    author = "Author: © Rafał Gardian",
    legal_title = "Rechtliche Informationen",
    legal_body = HTML(
      paste(
        "Alle Rechte vorbehalten. <br>",
        "Es ist verboten, den Quellcode ohne die Zustimmung des Autors zu verändern, zu kopieren oder die Anwendung für kommerzielle Zwecke zu nutzen. <br>",
        "Das Teilen eines öffentlichen Links zur App für nichtkommerzielle Zwecke ist erlaubt (und sogar erwünscht!)."
      )
    ),
    info_init = "Schritt 1: Wähle eine Tür!",
    info_final = "Schritt 2: Der Moderator hat eine der Türen geöffnet. Entscheidung! Tür wechseln oder bei der bisherigen Wahl bleiben?",
    info_win = "Runde beendet: GEWONNEN! Glückwunsch!",
    info_loss = "Runde beendet: verloren...",
    play_again = "Nochmals spielen",
    stats_title = "Gesamtstatistik",
    strat_stay = "Bleiben!",
    strat_switch = "Wechseln!",
    plot_title = "Strategie-Effektivität",
    y_label = "% Siege",
    door = "Tür",
    sim_label = "Simulation:",
    reset_stats = "Statistiken zurücksetzen",
    adv_settings = "Erweiterte Optionen (Statistik)",
    method_select = "KI-Methode:",
    conf_level = "Vertrauensniveau:",
    table_strat = "Strategie",
    table_n = "Versuche",
    table_pct = "Siege %",
    table_ci = "Konfidenzintervall",
    stat_win_abbr = "G",
    stat_loss_abbr = "N",
    total_label = "Spiele insgesamt",
    theory_label = "Teoria",
    mute_label = "Stummschalten",
    fair_title = "Preisverteilung (Zufallstest für geduldige Menschen)",
    fair_desc = "Wurde das Spiel wirklich so programmiert, dass die Preise in den Türen 1, 2 und 3 mit der gleichen Wahrscheinlichkeit (1/3) erscheinen? Das können Sie in diesem Reiter kontrollieren, auch wenn Sie geduldig sein müssen...",
    fair_extra = "Die folgende Grafik und Tabelle (angezeigt nach unserem ersten Spiel in dieser Sitzung) zeigen die Häufigkeit des Hauptpreises hinter jeder Tür. Nach dem Gesetz der großen Zahlen stabilisiert sich die Verteilung erst nach einer langen Versuchsreihe (mindestens 1000) bei etwa 33,3% pro Tür.",
    fair_extra2 = "Und hier sehen Sie eine ähnliche Grafik für alle Spiele (vorausgesetzt, eine bestimmte Spielserie wurde mit dem ordnungsgemäßen Beenden des Programms abgeschlossen) aller Anwendungsbenutzer, nicht nur für Ihre:",
    intro_text = "Willkommen beim Monty-Hall-Spiel! Wähle eine von drei Türen. Hinter einer ist ein Auto, hinter den anderen sind Zonks. Nach deiner Wahl öffnet der Moderator eine Tür mit einem Zonk und fragt, ob du wechseln möćhtest. Die Wahrscheinlichkeitsrechnung sagt, es lohnt sich! Aber ist das sicher? Überprüfen Sie es selbst!",
    intro_options_label = "Optionen:",
    intro_adv_info = "Sie können die Einstellungen, einschließlich der Sprache, jederzeit während des Spiels über das Zahnrad-Symbol in der oberen rechten Ecke ändern.",
    show_adv = "Erweiterte Statistikoptionen anzeigen",
    how_to_text = "1. Wähle eine Tür. 2. Der Moderator öffnet eine andere Tür mit einem Zonk. 3. Entscheide: Bleiben oder Wechseln. Die Grafiken unten zeigen die Effektivität deiner Strategie und statistische Konfidenzintervalle.",
    global_y_label = "Häufigkeit (N)",
    global_title = "Globale Systemzuverlässigkeit (Alle Spieler)"
  )
)

# 2. SCIENTIFIC & EDUCATIONAL CONTENT -----------------------------------------
# Static long-form content for the "Science Behind It" tab.
# Contains mathematical derivations, paradox explanations, and study notes.
science_texts <- list(
  pl = tagList(
    # Polish version of science and history text
    # Tittle
    h1("Historia i wyjaśnienie paradoksu Monty'ego Halla", style = "font-weight: 800; color: #2c3e50; margin-bottom: 30px; border-left: 10px solid #18bc9c; padding-left: 15px;"),
    
    p(
      fix_orphans(
        "Paradoks nazwę swą zawdzięcza Monty'emu Hallowi, gospodarzowi amerykańskiego teleturnieju 'Let's Make a Deal', znanego w Polsce jako 'Idź na całość'. Nieco upraszczając przebieg tej gry, można powiedzieć, że gra ta polegała na wyborze jednej z trzech bramek, in której tylko jedna zawierała nagrodę (np. samochód). Następnie, po odsłonięciu jednej z przegrywających bramek przez prowadzącego, gracz podejmował decyzję, czy zostaje przy swoim wyborze, czy zmienia go na drugą z bramek, która nie została do tej pory odsłonięta."
      )
    ),
    
    p(
      fix_orphans(
        "Co oczywiste, na początku gry szanse na wygraną przy wyborze dowolnej bramki są równe i wynoszą 1/3. Wydawałoby się, że po odsłonięciu jednej z przegrywających bramek przez prowadzącego i usunięciu jej z gry, szansa na wygraną w obu pozostałych bramkach jest jednakowa i wynosi 1/2. Tak jednak nie jest – i na tym właśnie polega paradoks Monty’ego Halla."
      )
    ),
    
    p(
      em(
        "Z ciekawostek dotyczących gry: przegrywająca bramka w teleturnieju nie była pusta. Znajdowały się tam tzw. zonki, czyli absurdalne, żartobliwe nagrody. O ile w wersji amerykańskiej były one bardzo zróżnicowane, w wersji polskiej i niemieckiej zostały one ustandaryzowane: były nimi maskotka kota w worku (Polska) oraz różowa, pluszowa koza (Niemcy)."
      ),
      style = "margin-bottom: 25px;"
    ),
    
    hr(),
    
    h3("Marilyn vos Savant", style = "color: #18bc9c; font-weight: bold; margin-top: 40px;"),
    p(
      fix_orphans(
        "Wszystko zaczęło się w 1990 roku, gdy Marilyn vos Savant – posiadaczka najwyższego IQ na świecie – opublikowała rozwiązanie zagadki w magazynie „Parade”. Jej odpowiedź na pytanie czytelnika o optymalną strategię: „Zmień bramkę! Szansa na wygraną wzrośnie dwukrotnie”, wywołała burzę. Redakcja otrzymała ponad 10 000 listów, w tym od wielu doktorów matematyki, którzy publicznie szydzili z jej „braku umiejętności logicznego myślenia”. Pisano w nich m.in.:"
      )
    ),
    
    tags$blockquote(
      "„Jako matematyk, obawiam się o poziom edukacji w tym kraju. Proszę przyznać się do błędu!”"
    ),
    tags$blockquote(
      "„Jest wiele matematycznego analfabetyzmu w tym kraju, nie potrzebujemy, by persona o rzekomo najwyższym IQ propagowała go więcej!”"
    ),
    tags$blockquote(
      "„Sugeruję sięgnięcie do standardowego podręcznika do rachunku prawdopodobieństwa przed udzielaniem odpowiedzi na podobne pytania”."
    ),
    
    p(
      fix_orphans(
        "Nadawcy tych listów mylili się. Rację miała vos Savant. Okazuje się, co zostanie niżej wykazane, że prawdopodobieństwo wygranej w przypadku zmiany bramki jest aż dwukrotnie wyższe, niż kiedy zostaniemy przy swoim pierwotnym wyborze."
      )
    ),
    
    h3("Nawet geniusze błądzą: Przypadek Paula Erdősa", style = "color: #18bc9c; font-weight: bold; margin-top: 40px;"),
    p(
      fix_orphans(
        "Jeśli intuicja podpowiada Ci wynik 50/50, nie masz powodów do zmartwień – zwodziła ona również ludzi niewątpliwie genialnych. Paul Erdős, jeden z najwybitniejszych matematyków XX wieku, początkowo kategorycznie odrzucił rozwiązanie Marilyn. Nie przekonały go dowody formalne ani drzewa decyzyjne. Erdős „skapitulował” dopiero wtedy, gdy pokazano mu symulację komputerową. Dopiero twarde dane z tysięcy prób zmusiły go do przyznania racji Marilyn."
      )
    ),
    
    hr(),
    
    h3("Dlaczego warto zmienić? Logika „determinacji”", style = "color: #18bc9c; font-weight: bold; margin-top: 40px;"),
    p(
      fix_orphans(
        "Kluczem do zrozumienia przewagi zmiany jest analiza dwóch scenariuszy:"
      )
    ),
    p(
      strong("Scenariusz „Trafiłeś” (1/3 szans):"),
      fix_orphans(
        " Wybierasz bramkę z autem. Prowadzący ma swobodę – otwiera jedną z dwóch bramek z kozami. Zmiana decyzji to przegrana."
      )
    ),
    p(
      strong("Scenariusz „Pudło” (2/3 szans):"),
      fix_orphans(
        " Wybierasz bramkę z kotem/kozą. Teraz prowadzący nie ma wyboru – jego ruch jest całkowicie zdeterminowany. Nie może otworzyć Twojej bramki ani tej z autem. Musi otworzyć tę konkretną bramkę z drugim 'zonkiem'. To „wypycha” auto za jedyną pozostałą zakrytą bramkę. Zmiana to gwarantowana wygrana. I właśnie fakt zdeterminowania wyboru wygrywającej bramki, jako tej z niewybranych przez gracza, która będzie aktywna w drugiej rundzie, w tym scenariuszu, jest powodem dla którego w ogólnym przypadku, po odrzuceniu jednej z bramek przez prowadzącego, prawdopodobieństwo wygranej w jednej z bramek rośnie: z 1/3 do 2/3."
      )
    ),
    
    p(fix_orphans(
      "A jak to wykazać w sposób formalny? O tym niżej."
    )),
    
    h3("Twierdzenie Bayesa a paradoks Monty’ego Halla", style = "color: #18bc9c; font-weight: bold; margin-top: 40px;"),
    p(
      HTML(
        "Pokażemy, że istotnie prawdopodobieństwo wygranej przy zmianie decyzji po odsłonięciu jednej z&nbsp;bramek przez prowadzącego jest dwukrotnie większe niż prawdopodobieństwo wygranej w&nbsp;sytuacji, gdy gracz pozostaje przy swym pierwotnym wyborze."
      )
    ),
    
    p(strong("Przyjmijmy oznaczenia:")),
    tags$ul(
      tags$li(HTML(
        "\\( P(A) \\) — prawdopodobieństwo zdarzenia \\( A \\)"
      )),
      tags$li(
        HTML(
          "\\( P(A|B) \\) — prawdopodobieństwo zdarzenia \\( A \\), pod warunkiem, że zaszło zdarzenie \\( B \\)"
        )
      ),
      tags$li(HTML("\\( D = \\{1,2,3\\} \\) — bramki")),
      tags$li(HTML("\\( W \\in D \\) — bramka z&nbsp;nagrodą")),
      tags$li(HTML("\\( X \\in D \\) — wybór bramki przez gracza")),
      tags$li(HTML(
        "\\( M \\in D \\) — bramka otwarta przez prowadzącego"
      ))
    ),
    
    p(strong("Założenia:")),
    p(HTML("\\( P(W=i)=1/3 \\), \\( P(X=i)=1/3 \\)")),
    
    p(
      HTML(
        "Prowadzący zna \\( W \\), wybiera \\( M \\neq X \\), zawsze otwiera drzwi z&nbsp;przegraną (\\( M \\neq W \\)), a&nbsp;jeśli ma wybór, losuje równomiernie."
      )
    ),
    
    p(
      HTML(
        "Bez straty ogólności przyjmijmy, że \\( X=1 \\). Pod tym założeniem mamy:"
      )
    ),
    tags$ul(
      tags$li(
        HTML(
          "\\( P(M=1)=0 \\) (bo prowadzący nie może wybrać bramki wybranej przez gracza),"
        )
      ),
      tags$li(
        HTML("\\( P(M=2)=1/2 \\) (prowadzący ma do wyboru bramkę 2&nbsp;lub 3),")
      ),
      tags$li(HTML("\\( P(M=3)=1/2 \\),")),
      tags$li(HTML("\\( P(M=2|W=1)=1/2 \\),")),
      tags$li(
        HTML(
          "\\( P(M=2|W=3)=1 \\) (gdyż wybór bramki nr&nbsp;2 przez prowadzącego jest w&nbsp;pełni zdeterminowany przez to, że bramkę nr&nbsp;1 wybrał gracz, a&nbsp;bramka nr&nbsp;3 zawiera nagrodę),"
        )
      ),
      tags$li(HTML("\\( P(M=3|W=1)=1/2 \\),")),
      tags$li(HTML("\\( P(M=3|W=2)=1 \\)."))
    ),
    
    p(
      HTML(
        "Policzmy \\( P(W=1|M=2) \\) oraz \\( P(W=3|M=2) \\). Korzystając z&nbsp;twierdzenia Bayesa, mamy:"
      )
    ),
    
    withMathJax(
      p(
        "$$P(W=1|M=2) = \\frac{P(M=2|W=1) \\cdot P(W=1)}{P(M=2)} = \\frac{1/2 \\cdot 1/3}{1/2} = 1/3$$"
      ),
      p(
        "$$P(W=3|M=2) = \\frac{P(M=2|W=3) \\cdot P(W=3)}{P(M=2)} = \\frac{1 \\cdot 1/3}{1/2} = 2/3$$"
      )
    ),
    
    p(
      HTML(
        "Wykonując analogiczne obliczenia, dostaniemy wartości \\( P(W=1|M=3)=1/3 \\) oraz \\( P(W=2|M=3)=2/3 \\)."
      )
    ),
    
    p(
      HTML(
        "Zatem w&nbsp;przypadku, gdy gracz na początku wybrał pierwszą bramkę, niezależnie od wyboru bramki do otworzenia przez prowadzącego, prawdopodobieństwo wygranej jest dwukrotnie większe przy zmianie decyzji gracza niż w&nbsp;przypadku pozostania przy swoim wyborze. Ponieważ prawdopodobieństwa te nie mogą zależeć od początkowego wyboru (obliczenia dla \\( X=2 \\) oraz \\( X=3 \\) byłyby w&nbsp;pełni analogiczne), postawiona na początku niniejszego paragrafu teza została udowodniona."
      )
    ),
    
    author_sign
  ),
  en = tagList(
    # Ennglish version
    # TITLE
    h1("History and Explanation of the Monty Hall Paradox", style = "font-weight: 800; color: #2c3e50; margin-bottom: 30px; border-left: 10px solid #18bc9c; padding-left: 15px;"),
    
    p(
      fix_orphans(
        "The paradox owes its name to Monty Hall, the host of the American television game show 'Let's Make a Deal'. Simplifying the course of this game, it can be said that it consisted of choosing one of three doors, in which only one contained a prize (e.g., a car). Then, after one of the losing doors was revealed by the host, the player made a decision whether to stay with their choice or change it to the other door that had not been revealed so far."
      )
    ),
    
    p(
      fix_orphans(
        "Obviously, at the beginning of the game, the chances of winning when choosing any door are equal and amount to 1/3. It would seem that after one of the losing doors is revealed by the host and removed from the game, the chance of winning in both remaining doors is the same and amounts to 1/2. However, this is not the case – and this is exactly what the Monty Hall paradox is about."
      )
    ),
    
    p(
      em(
        "Fun fact about the game: the losing door in the game show was not empty. There were so-called 'Zonks', which were absurd, humorous prizes. While in the American version they were very diverse, in the Polish and German versions they were standardized: they were a 'cat in a bag' mascot (Poland) and a pink, plush goat (Germany)."
      ),
      style = "margin-bottom: 25px;"
    ),
    
    hr(),
    
    h3("Marilyn vos Savant", style = "color: #18bc9c; font-weight: bold; margin-top: 40px;"),
    p(
      fix_orphans(
        "It all started in 1990 when Marilyn vos Savant – holder of the highest IQ in the world – published the solution to the riddle in 'Parade' magazine. Her answer to a reader's question about the optimal strategy: 'Switch doors! The chance of winning will double', caused a storm. The editorial office received over 10,000 letters, including many from PhDs in mathematics, who publicly mocked her 'lack of logical thinking skills'. They wrote, among other things:"
      )
    ),
    
    tags$blockquote(
      "“As a mathematician, I am concerned about the level of education in this country. Please admit your mistake!”"
    ),
    tags$blockquote(
      "“There is a lot of mathematical illiteracy in this country, we don't need a person with the supposedly highest IQ propagating more of it!”"
    ),
    tags$blockquote(
      "“I suggest reaching for a standard textbook on probability theory before answering similar questions.”"
    ),
    
    p(
      fix_orphans(
        "The senders of these letters were wrong. Vos Savant was right. It turns out, as will be demonstrated below, that the probability of winning in the case of switching doors is as much as twice as high as when we stay with our original choice."
      )
    ),
    
    h3("Even Geniuses Erred: The Case of Paul Erdős", style = "color: #18bc9c; font-weight: bold; margin-top: 40px;"),
    p(
      fix_orphans(
        "If your intuition tells you a 50/50 result, you have no reason to worry – it also deceived undoubtedly brilliant people. Paul Erdős, one of the most prominent mathematicians of the 20th century, initially categorically rejected Marilyn's solution. He was not convinced by formal proofs or decision trees. Erdős 'surrendered' only when he was shown a computer simulation. Only hard data from thousands of trials forced him to admit Marilyn was right."
      )
    ),
    
    hr(),
    
    h3("Why is it worth switching? The Logic of 'Determination'", style = "color: #18bc9c; font-weight: bold; margin-top: 40px;"),
    p(
      fix_orphans(
        "The key to understanding the advantage of switching is an analysis of two scenarios:"
      )
    ),
    p(
      strong("Scenario 'You Hit' (1/3 chance):"),
      fix_orphans(
        " You choose the door with the car. The host has freedom – he opens one of the two doors with Zonks. Changing your decision is a loss."
      )
    ),
    p(
      strong("Scenario 'Miss' (2/3 chance):"),
      fix_orphans(
        " You choose a door with a Zonk. Now the host has no choice – his move is completely determined. He cannot open your door or the one with the car. He must open that specific door with the second Zonk. This 'pushes' the car behind the only remaining closed door. Switching is a guaranteed win. And the very fact of the determination of the winning door choice, as the one of those not chosen by the player that will be active in the second round in this scenario, is the reason why in the general case, after one door is discarded by the host, the probability of winning in one of the doors increases: from 1/3 to 2/3."
      )
    ),
    
    p(
      fix_orphans("And how to demonstrate this in a formal way? See below.")
    ),
    
    h3("Bayes' Theorem and the Monty Hall Paradox", style = "color: #18bc9c; font-weight: bold; margin-top: 40px;"),
    p(
      HTML(
        "We will show that the probability of winning when changing the decision after the host reveals one of the doors is indeed twice as high as the probability of winning when the player stays with their initial choice."
      )
    ),
    
    p(strong("Let's adopt the notations:")),
    tags$ul(
      tags$li(HTML("\\( P(A) \\) — probability of event \\( A \\)")),
      tags$li(
        HTML(
          "\\( P(A|B) \\) — probability of event \\( A \\), given that event \\( B \\) occurred"
        )
      ),
      tags$li(HTML("\\( D = \\{1,2,3\\} \\) — doors")),
      tags$li(HTML("\\( W \\in D \\) — door with the prize")),
      tags$li(HTML("\\( X \\in D \\) — door chosen by the player")),
      tags$li(HTML("\\( M \\in D \\) — door opened by the host"))
    ),
    
    p(strong("Assumptions:")),
    p(HTML("\\( P(W=i)=1/3 \\), \\( P(X=i)=1/3 \\)")),
    
    p(
      HTML(
        "The host knows \\( W \\), chooses \\( M \\neq X \\), always opens a losing door (\\( M \\neq W \\)), and if he has a choice, he draws uniformly."
      )
    ),
    
    p(
      HTML(
        "Without loss of generality, let's assume that \\( X=1 \\). Under this assumption, we have:"
      )
    ),
    tags$ul(
      tags$li(
        HTML(
          "\\( P(M=1)=0 \\) (because the host cannot choose the door chosen by the player),"
        )
      ),
      tags$li(
        HTML("\\( P(M=2)=1/2 \\) (the host has a choice between door 2 or 3),")
      ),
      tags$li(HTML("\\( P(M=3)=1/2 \\),")),
      tags$li(HTML("\\( P(M=2|W=1)=1/2 \\),")),
      tags$li(
        HTML(
          "\\( P(M=2|W=3)=1 \\) (since the host's choice of door No. 2 is fully determined by the fact that the player chose door No. 1 and door No. 3 contains the prize),"
        )
      ),
      tags$li(HTML("\\( P(M=3|W=1)=1/2 \\),")),
      tags$li(HTML("\\( P(M=3|W=2)=1 \\)."))
    ),
    
    p(
      HTML(
        "Let's calculate \\( P(W=1|M=2) \\) and \\( P(W=3|M=2) \\). Using Bayes' theorem, we have:"
      )
    ),
    
    withMathJax(
      p(
        "$$P(W=1|M=2) = \\frac{P(M=2|W=1) \\cdot P(W=1)}{P(M=2)} = \\frac{1/2 \\cdot 1/3}{1/2} = 1/3$$"
      ),
      p(
        "$$P(W=3|M=2) = \\frac{P(M=2|W=3) \\cdot P(W=3)}{P(M=2)} = \\frac{1 \\cdot 1/3}{1/2} = 2/3$$"
      )
    ),
    
    p(
      HTML(
        "Performing analogous calculations, we will get the values \\( P(W=1|M=3)=1/3 \\) and \\( P(W=2|M=3)=2/3 \\)."
      )
    ),
    
    p(
      HTML(
        "Therefore, in the case where the player initially chose the first door, regardless of the host's choice of door to open, the probability of winning is twice as high when switching the decision than when staying with the choice. Since these probabilities cannot depend on the initial choice (calculations for \\( X=2 \\) and \\( X=3 \\) would be fully analogous), the thesis stated at the beginning of this paragraph has been proven."
      )
    ),
    
    author_sign
  ),
  de = tagList(
    # German version
    # TITTLE
    h1("Geschichte und Erklärung des Monty-Hall-Paradoxons", style = "font-weight: 800; color: #2c3e50; margin-bottom: 30px; border-left: 10px solid #18bc9c; padding-left: 15px;"),
    
    p(
      fix_orphans(
        "Das Paradoxon verdankt seinen Namen Monty Hall, dem Moderator der amerikanischen Spielshow 'Let's Make a Deal', die in Deutschland unter dem Titel 'Geh aufs Ganze!' bekannt ist. Vereinfacht ausgedrückt bestand dieses Spiel darin, eine von drei Türen zu wählen, von denen nur eine einen Preis (z. B. ein Auto) enthielt. Nachdem der Moderator eine der Verlierertüren geöffnet hatte, traf der Spieler die Entscheidung, ob er bei seiner Wahl bleiben oder zu der anderen, bisher nicht geöffneten Tür wechseln möchte."
      )
    ),
    
    p(
      fix_orphans(
        "Offensichtlich sind zu Beginn des Spiels die Gewinnchancen bei der Wahl jeder Tür gleich und betragen 1/3. Es scheint, dass nach dem Öffnen einer der Verlierertüren durch den Moderator und deren Ausscheiden aus dem Spiel die Gewinnchance bei beiden verbleibenden Türen gleich ist und 1/2 beträgt. Dies ist jedoch nicht der Fall – und genau darin besteht das Monty-Hall-Paradoxon."
      )
    ),
    
    p(
      em(
        "Interessante Tatsache zum Spiel: Die Verlierertür in der Spielshow war nicht leer. Dort befanden sich sogenannte 'Zonks', also absurde, scherzhafte Preise. Während diese in der amerikanischen Version sehr vielfältig waren, wurden sie in der polnischen und deutschen Version standardisiert: Es waren ein 'Stofftier Katze im Sack' (Polen) und eine rosa Stoffziege (Deutschland)."
      ),
      style = "margin-bottom: 25px;"
    ),
    
    hr(),
    
    h3("Marilyn vos Savant", style = "color: #18bc9c; font-weight: bold; margin-top: 40px;"),
    p(
      fix_orphans(
        "Alles begann im Jahr 1990, als Marilyn vos Savant – Inhaberin des weltweit höchsten IQ – die Lösung des Rätsels im Magazin „Parade“ veröffentlichte. Ihre Antwort auf die Frage eines Lesers nach der optimalen Strategie: „Wechseln Sie die Tür! Die Gewinnchance wird sich verdoppeln“, löste einen Sturm aus. Die Redaktion erhielt über 10.000 Briefe, darunter viele von Doktoren der Mathematik, die sie öffentlich wegen ihres „Mangels an logischem Denkvermögen“ verspotteten. Sie schrieben unter anderem:"
      )
    ),
    
    tags$blockquote(
      "„Als Mathematiker bin ich besorgt über das Bildungsniveau in diesem Land. Bitte geben Sie Ihren Fehler zu!“"
    ),
    tags$blockquote(
      "„Es gibt viel mathematischen Analphabetismus in diesem Land, wir brauchen keine Person mit dem angeblich höchsten IQ, die noch mehr davon verbreitet!“"
    ),
    tags$blockquote(
      "„Ich schlage vor, ein Standardlehrwerk zur Wahrscheinlichkeitsrechnung zu Rate zu ziehen, bevor Sie ähnliche Fragen beantworten.“"
    ),
    
    p(
      fix_orphans(
        "Die Absender dieser Briefe irrten sich. Vos Savant hatte recht. Es stellt sich heraus, wie unten gezeigt wird, dass die Gewinnwahrscheinlichkeit im Falle eines Türwechsels doppelt so hoch ist wie wenn wir bei unserer ursprünglichen Wahl bleiben."
      )
    ),
    
    h3("Selbst Genies irren sich: Der Fall Paul Erdős", style = "color: #18bc9c; font-weight: bold; margin-top: 40px;"),
    p(
      fix_orphans(
        "Wenn Ihnen Ihre Intuition ein 50/50-Ergebnis sagt, haben Sie keinen Grund zur Sorge – sie täuschte auch zweifellos brillante Menschen. Paul Erdős, einer der bedeutendsten Mathematiker des 20. Jahrhunderts, lehnte Marilyns Lösung zunächst kategorisch ab. Weder formale Beweise noch Entscheidungsbäume konnten ihn überzeugen. Erdős „kapitulierte“ erst, als man ihm eine Computersimulation zeigte. Erst harte Daten aus Tausenden von Versuchen zwangen ihn zuzugeben, dass Marilyn recht hatte."
      )
    ),
    
    hr(),
    
    h3(
      "Warum lohnt sich der Wechsel? Die Logik der „Determination“",
      style = "color: #18bc9c; font-weight: bold; margin-top: 40px;"
    ),
    p(
      fix_orphans(
        "Der Schlüssel zum Verständnis des Vorteils eines Wechsels ist die Analyse zweier Szenarien:"
      )
    ),
    p(
      strong("Szenario „Treffer“ (1/3 Chance):"),
      fix_orphans(
        " Sie wählen die Tür mit dem Auto. Der Moderator hat die Freiheit – er öffnet eine der zwei Türen mit Ziegen. Eine Änderung der Entscheidung bedeutet eine Niederlage."
      )
    ),
    p(
      strong("Szenario „Niete“ (2/3 Chance):"),
      fix_orphans(
        " Sie wählen eine Tür mit einer Ziege. Nun hat der Moderator keine Wahl – sein Zug ist vollständig determiniert. Er kann weder Ihre Tür noch die mit dem Auto öffnen. Er muss genau jene Tür mit der zweiten Ziege öffnen. Dies „schiebt“ das Auto hinter die einzige verbleibende geschlossene Tür. Ein Wechsel ist ein garantierter Gewinn. Und genau die Tatsache der Determination der Wahl der Gewinnertür – als diejenige der vom Spieler nicht gewählten Türen, die in der zweiten Runde aktiv sein wird – ist in diesem Szenario der Grund, warum im allgemeinen Fall, nachdem eine Tür vom Moderator verworfen wurde, die Gewinnwahrscheinlichkeit bei einer der Türen steigt: von 1/3 auf 2/3."
      )
    ),
    
    p(
      fix_orphans("Und wie lässt sich das formal nachweisen? Siehe unten.")
    ),
    
    h3("Bayes-Theorem und das Monty-Hall-Paradoxon", style = "color: #18bc9c; font-weight: bold; margin-top: 40px;"),
    p(
      HTML(
        "Wir werden zeigen, dass die Gewinnwahrscheinlichkeit bei einer Änderung der Entscheidung nach dem Öffnen einer der Türen durch den Moderator tatsächlich doppelt so hoch ist wie die Gewinnwahrscheinlichkeit in der Situation, in der der Spieler bei seiner ursprünglichen Wahl bleibt."
      )
    ),
    
    p(strong("Nehmen wir folgende Bezeichnungen an:")),
    tags$ul(
      tags$li(HTML(
        "\\( P(A) \\) — Wahrscheinlichkeit des Ereignisses \\( A \\)"
      )),
      tags$li(
        HTML(
          "\\( P(A|B) \\) — Wahrscheinlichkeit des Ereignisses \\( A \\) unter der Bedingung, dass das Ereignis \\( B \\) eingetreten ist"
        )
      ),
      tags$li(HTML("\\( D = \\{1,2,3\\} \\) — Türen")),
      tags$li(HTML("\\( W \\in D \\) — Tür mit dem Gewinn")),
      tags$li(HTML(
        "\\( X \\in D \\) — Wahl der Tür durch den Spieler"
      )),
      tags$li(HTML(
        "\\( M \\in D \\) — vom Moderator geöffnete Tür"
      ))
    ),
    
    p(strong("Annahmen:")),
    p(HTML("\\( P(W=i)=1/3 \\), \\( P(X=i)=1/3 \\)")),
    
    p(
      HTML(
        "Der Moderator kennt \\( W \\), wählt \\( M \\neq X \\), öffnet immer eine Tür mit einer Niete (\\( M \\neq W \\)) und lost gleichmäßig aus, falls er eine Wahl hat."
      )
    ),
    
    p(
      HTML(
        "Ohne Einschränkung der Allgemeinheit nehmen wir an, dass \\( X=1 \\). Unter dieser Annahme haben wir:"
      )
    ),
    tags$ul(
      tags$li(
        HTML(
          "\\( P(M=1)=0 \\) (da der Moderator die vom Spieler gewählte Tür nicht wählen kann),"
        )
      ),
      tags$li(
        HTML(
          "\\( P(M=2)=1/2 \\) (der Moderator hat die Wahl zwischen Tür 2 oder 3),"
        )
      ),
      tags$li(HTML("\\( P(M=3)=1/2 \\),")),
      tags$li(HTML("\\( P(M=2|W=1)=1/2 \\),")),
      tags$li(
        HTML(
          "\\( P(M=2|W=3)=1 \\) (da die Wahl von Tür Nr. 2 durch den Moderator vollständig dadurch determiniert ist, dass der Spieler Tür Nr. 1 gewählt hat und Tür Nr. 3 den Gewinn enthält),"
        )
      ),
      tags$li(HTML("\\( P(M=3|W=1)=1/2 \\),")),
      tags$li(HTML("\\( P(M=3|W=2)=1 \\)."))
    ),
    
    p(
      HTML(
        "Berechnen wir \\( P(W=1|M=2) \\) und \\( P(W=3|M=2) \\). Unter Verwendung des Bayes-Theorems erhalten wir:"
      )
    ),
    
    withMathJax(
      p(
        "$$P(W=1|M=2) = \\frac{P(M=2|W=1) \\cdot P(W=1)}{P(M=2)} = \\frac{1/2 \\cdot 1/3}{1/2} = 1/3$$"
      ),
      p(
        "$$P(W=3|M=2) = \\frac{P(M=2|W=3) \\cdot P(W=3)}{P(M=2)} = \\frac{1 \\cdot 1/3}{1/2} = 2/3$$"
      )
    ),
    
    p(
      HTML(
        "Durch analoge Berechnungen erhalten wir die Werte \\( P(W=1|M=3)=1/3 \\) und \\( P(W=2|M=3)=2/3 \\)."
      )
    ),
    
    p(
      HTML(
        "Somit ist in dem Fall, in dem der Spieler zu Beginn die erste Tür gewählt hat, unabhängig von der Wahl der zu öffnenden Tür durch den Moderator, die Gewinnwahrscheinlichkeit bei einer Änderung der Entscheidung doppelt so hoch wie beim Verbleiben bei der ursprünglichen Wahl. Da diese Wahrscheinlichkeiten nicht von der ursprünglichen Wahl abhängen können (Berechnungen für \\( X=2 \\) und \\( X=3 \\) wären völlig analog), wurde die zu Beginn dieses Abschnitts aufgestellte These bewiesen."
      )
    ),
    
    author_sign
  )
)