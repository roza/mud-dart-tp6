# MUD en Dart — TP6

Point de départ du TP6 : c'est le corrigé du TP5, plus quelques fichiers JSON
dans `data/`. L'énoncé est dans `TP6.pdf`.

```bash
dart pub get
dart test        # 26 tests doivent passer avant de commencer
dart run
```

- `data/mud.json`      : une sauvegarde valide (2 boites)
- `data/casse.json`    : un JSON mal formé (crochet manquant)
- `data/sans-nom.json` : un JSON valide, mais une chose n'a pas de nom

## Travailler dans le navigateur (GitHub Codespaces)

Sans Dart sur votre ordinateur, ouvrez **votre** dépôt sur GitHub, puis
**Code** > **Codespaces** > **Create codespace on main**. Un VS Code
s'ouvre dans le navigateur, avec Dart déjà installé : `dart test`,
`dart run` et git fonctionnent comme au lycée.

**À la fin de chaque séance : push, puis Stop.**

1. `git status`, puis `git push` : ce qui n'est pas poussé ne reste que
   dans le codespace.
2. Arrêtez le codespace : `Ctrl+Maj+P` > **Codespaces: Stop Current
   Codespace**, ou sur <https://github.com/codespaces> : **…** >
   **Stop codespace**. Fermer l'onglet ne suffit pas : il continuerait de
   consommer votre temps gratuit pendant 30 minutes.
3. Une fois le travail poussé, vous pouvez aussi le supprimer (**…** >
   **Delete**) : il suffira d'en recréer un la prochaine fois.
