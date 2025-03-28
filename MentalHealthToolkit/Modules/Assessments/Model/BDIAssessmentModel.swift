//
//  BDIAssessmentModel.swift
//  HealthJournal
//
//  Created by Santiago Gabriel Cento on 17/09/2024.
//

import Foundation

struct BDIAssessment: Hashable, Codable {
    var healthyDay: HealthyDay
    var instructions: BDIAssessmentInstructions
    var questions: [BDIAssessmentQuestion]
    
    init(instructions: BDIAssessmentInstructions = BDIAssessmentInstructions.instructions,
         questions: [BDIAssessmentQuestion] = BDIAssessmentQuestion.questions,
         healthyDay: HealthyDay) {
        self.instructions = instructions
        self.questions = questions
        self.healthyDay = healthyDay
    }
}

struct BDIAssessmentInstructions: Hashable, Codable {
    var title: String, description: String
    
    static let instructions = BDIAssessmentInstructions(
        title: "Instrucciones:",
        description: "Este cuestionario consta de 21 grupos de afirmaciones. Por favor, lea con atención cada uno de ellos cuidadosamente. Luego elija uno de cada grupo, el que mejor describa el modo como se ha sentido las últimas dos semanas, incluyendo el día de hoy. Marque con un círculo el número correspondiente al enunciado elegido Si varios enunciados de un mismo grupo le parecen igualmente apropiados, marque el número más alto. Verifique que no haya elegido más de uno por grupo, incluyendo el ítem 16 (cambios en los hábitos de Sueño) y el ítem 18 (cambios en el apetito)")
}

struct BDIAssessmentQuestion: Hashable, Codable {
    
    var question: String
    var options: [BDIAssessmentQuestionOption]
    
    static var questions: [BDIAssessmentQuestion] = [
        BDIAssessmentQuestion(question: "Tristeza", options: [
            BDIAssessmentQuestionOption(affirmation: "No me siento triste", points: 0),
            BDIAssessmentQuestionOption(affirmation: "Me siento triste gran parte del tiempo", points: 1),
            BDIAssessmentQuestionOption(affirmation: "Me siento triste todo el tiempo", points: 2),
            BDIAssessmentQuestionOption(affirmation: "Me siento tan triste o soy tan infeliz que no puedo soportarlo", points: 3),
        ]),
        BDIAssessmentQuestion(question: "Pesimismo", options:  [
            BDIAssessmentQuestionOption(affirmation: "No estoy desalentado respecto del mi futuro", points: 0),
            BDIAssessmentQuestionOption(affirmation: "Me siento más desalentado respecto de mi futuro que lo que solía estarlo", points: 1),
            BDIAssessmentQuestionOption(affirmation: "No espero que las cosas funcionen para mi", points: 2),
            BDIAssessmentQuestionOption(affirmation: "Siento que no hay esperanza para mi futuro y que sólo puede empeorar", points: 3),
        ]),
        BDIAssessmentQuestion(question: "Fracaso", options: [
            BDIAssessmentQuestionOption(affirmation: "No me siento como un fracasado.", points: 0),
            BDIAssessmentQuestionOption(affirmation: "He fracasado más de lo que hubiera debido.", points: 1),
            BDIAssessmentQuestionOption(affirmation: "Cuando miro hacia atrás, veo muchos fracasos.", points: 2),
            BDIAssessmentQuestionOption(affirmation: "Siento que como persona soy un fracaso total.", points: 3),
        ]),
        BDIAssessmentQuestion(question: "Pérdida de placer", options: [
            BDIAssessmentQuestionOption(affirmation: "Obtengo tanto placer como siempre por las cosas de las que disfruto.", points: 0),
            BDIAssessmentQuestionOption(affirmation: "No disfruto tanto de las cosas como solía hacerlo.", points: 1),
            BDIAssessmentQuestionOption(affirmation: "Obtengo muy poco placer de las cosas que solía disfrutar.", points: 2),
            BDIAssessmentQuestionOption(affirmation: "No puedo obtener ningún placer de las cosas de las que solía disfrutar.", points: 3),
        ]),
        BDIAssessmentQuestion(question: "Sentimientos de culpa", options: [
            BDIAssessmentQuestionOption(affirmation: "No me siento particularmente culpable.", points: 0),
            BDIAssessmentQuestionOption(affirmation: "Me siento culpable respecto de varias cosas que he hecho o que debería haber", points: 1),
            BDIAssessmentQuestionOption(affirmation: "Me siento bastante culpable la mayor parte del tiempo.", points: 2),
            BDIAssessmentQuestionOption(affirmation: "Me siento culpable todo el tiempo.", points: 3),
        ]),
//        BDIAssessmentQuestion(question: "Sentimientos de castigo", options: []),
//        BDIAssessmentQuestion(question: "Disconformidad con uno mismo", options: []),
//        BDIAssessmentQuestion(question: "Autocrítica", options: []),
//        BDIAssessmentQuestion(question: "Pensamientos o Deseos Suicidas", options: []),
//        BDIAssessmentQuestion(question: "LLanto", options: []),
//        BDIAssessmentQuestion(question: "Agitación", options: []),
//        BDIAssessmentQuestion(question: "Pérdida de Interés", options: []),
//        BDIAssessmentQuestion(question: "Indecisión", options: []),
//        BDIAssessmentQuestion(question: "Desvalorización", options: []),
//        BDIAssessmentQuestion(question: "Pérdida de Energía", options: []),
//        BDIAssessmentQuestion(question: "Cambios en los Hábitos de Sueño", options: []),
//        BDIAssessmentQuestion(question: "Irritabilidad", options: []),
//        BDIAssessmentQuestion(question: "Cambios en el Apetito", options: []),
//        BDIAssessmentQuestion(question: "Dificultad de Concentración", options: []),
//        BDIAssessmentQuestion(question: "Cansancio o Fatiga", options: []),
//        BDIAssessmentQuestion(question: "Pérdida de Interés en el Sexo", options: []),
        ]
}

struct BDIAssessmentQuestionOption: Hashable, Codable {
    var affirmation: String
    var points: Int
    var selected: Bool = false
    
    init(affirmation: String, points: Int) {
        self.affirmation = affirmation
        self.points = points
    }
}

enum BDIAssessmentState {
    case info, assessment, result
}
