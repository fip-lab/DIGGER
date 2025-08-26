(define (domain team_fortress_mic_usage)
  (:requirements :strips :typing)
  (:types entity attribute)

  (:predicates
    (connected ?entity - entity)
    (plugged-in ?entity - entity)
    (functional ?entity - entity)
    (tested ?entity - entity)
    (visible ?entity - entity)
    (open ?entity - entity)
    (selected ?entity - entity)
    (heard ?entity - entity)
    (talking ?entity - entity)
    (efficient ?entity - entity)
    (possible ?entity - entity)
    (supported ?entity - entity)
  )

  (:action make_microphone_working
    :parameters (?microphone - entity)
    :precondition (and (not (connected ?microphone)) (not (plugged-in ?microphone)) (not (functional ?microphone)) (not (tested ?microphone)))
    :effect (and (connected ?microphone) (plugged-in ?microphone) (functional ?microphone) (tested ?microphone))
  )

  (:action adjust_panel_visibility
    :parameters (?panel - entity)
    :precondition (and (not (visible ?panel)) (not (open ?panel)))
    :effect (and (visible ?panel) (open ?panel))
  )

  (:action select_voice_panel
    :parameters (?panel - entity)
    :precondition (and (visible ?panel) (not (selected ?panel)))
    :effect (selected ?panel)
  )

  (:action talk_using_microphone
    :parameters (?microphone - entity ?voice - entity)
    :precondition (and (connected ?microphone) (functional ?microphone) (not (heard ?voice)))
    :effect (heard ?voice)
  )

  (:action use_microphone_efficiently
    :parameters (?voice - entity)
    :precondition (and (heard ?voice) (not (efficient ?voice)))
    :effect (efficient ?voice)
  )

  (:action advise_teammates
    :parameters (?advice - entity)
    :precondition (not (possible ?advice))
    :effect (possible ?advice)
  )
)