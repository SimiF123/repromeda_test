# repromeda_test
Popis: Táto aplikácia je interaktívny nástroj vytvorený pomocou R Shiny, ktorý umožňuje užívateľom spravovať a vizualizovať záznamy s nasledujúcimi funkciami:

    Zobrazenie tabuľky: Interaktívna tabuľka s údajmi obsahujúcimi ID, Výsledek a Popis.

    Pridanie záznamu: Možnosť pridať nový záznam s automaticky generovaným ID.

    Mazanie záznamu: Možnosť vymazať vybraný záznam z tabuľky.

    Export do CSV: Export aktuálnych údajov do CSV súboru.

    Vizualizácia: Graf zobrazujúci počet záznamov podľa výsledku.

Inštalácia: Pred spustením aplikácie je potrebné nainštalovať nasledujúce R balíčky:

    shiny

    ggplot2

    DT

Použitie:

    Pridanie záznamu:

        Vyberte hodnotu z rozbaľovacieho zoznamu "Výsledek".

        Zadajte popis do textového poľa "Popis".

        Kliknite na tlačidlo "Přidat záznam" pre pridanie nového záznamu do tabuľky.

    Mazanie záznamu:

        Kliknite na riadok v tabuľke, ktorý chcete vymazať (riadok bude zvýraznený).

        Kliknite na tlačidlo "Smazat vybraný záznam" pre odstránenie vybraného záznamu.

    Export do CSV:

        Kliknite na tlačidlo "Exportovat do CSV" pre stiahnutie aktuálnych údajov vo formáte CSV.
