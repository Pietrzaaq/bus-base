
Declare @imiona VARCHAR(8000) = 'Jan, Marcin, Marek, Joanna, Weronika, Kacper, Wiktor, Wiktoria, Dawid, Mateusz,
          Agnieszka, Piotr, Aleksander, Aleksandra, Katarzyna, Andrzej, Adrian, Bartosz, Michał,
          Władysław, Patryk, Szymon, Angelika, Filip, Krysztof, Zdzisław, Jadwiga, Dariusz, Sara,
          Kinga, Artur, Stefan, Hanna, Tytus, Modest, Wojciech, Patrycja'
declare @dl varchar(20) = LEN(@imiona) - LEN(REPLACE(@imiona, ',', '')) +1
DECLARE @liczba INT = CAST(@dl AS INT)
DECLARE @num INT = ROUND(RAND()*@liczba,0) + 1
INSERT INTO demo (name, hint)
VALUES (CHOOSE(@num, 'Jan', 'Marcin', 'Marek', 'Joanna', 'Weronika', 'Kacper', 'Wiktor', 'Wiktoria', 'Dawid', 'Mateusz',
          'Agnieszka', 'Piotr', 'Aleksander', 'Aleksandra', 'Katarzyna', 'Andrzej', 'Adrian', 'Bartosz', 'Michał',
          'Władysław', 'Patryk', 'Szymon', 'Angelika', 'Filip', 'Krysztof', 'Zdzisław', 'Jadwiga', 'Dariusz', 'Sara',
          'Kinga', 'Artur', 'Stefan', 'Hanna', 'Tytus', 'Modest', 'Wojciech', 'Patrycja'),@dl)