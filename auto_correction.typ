#let isCorrecting = () => {
  return sys.inputs.at("correcting", default: "false") == "true"
}

#let showNextAnswer = (answerIdx, answersPerQuestion, questionIdx) => {
  return calc.rem(answerIdx, answersPerQuestion) == calc.rem(questionIdx, answersPerQuestion)
}

// Crée un tableau lacunaire / complet à partir de plusieurs listes de réponses
// Paramètres:
//  ..args: Les listes à pour construire le tableau (colonnes), arguments positionnels
//  correcting: Si vrai, le tableau contient toutes les réponses (par défaut: entrée "correcting" de la CLI)
//  isAnswerShownFn: Fonction qui prend en paramètre (answerIdx, answersPerQuestion, questionIdx) et renvoie un booléen qui indique si une valeur sera affichée (par défaut: affiche chaque fois la réponse suivante (escalier))
//
#let answersTableFromArrays = (..args, correcting: isCorrecting(), isAnswerShownFn: showNextAnswer) => {
  let contentOut = ()
  let allAnswers = args.pos()

  assert(allAnswers.len() != 0, message: "Précisez au moins une liste pour le tableau !")

  let questionsCount = allAnswers.at(0).len()
  let answersPerQuestion = allAnswers.len()

  for questionIdx in range(questionsCount) {
    let questionAnswers = allAnswers.map(x => x.at(questionIdx, default: []))

    if correcting {
      contentOut.push(questionAnswers)
    } else {
      let partialAnswers = questionAnswers.enumerate().map(it => {
        let (answerIdx, answerValue) = it
        if isAnswerShownFn(answerIdx, answersPerQuestion, questionIdx) {
          answerValue
        } else {
          []
        }
      })
      
      contentOut.push(partialAnswers)
    }
  }

  contentOut.flatten()
}
