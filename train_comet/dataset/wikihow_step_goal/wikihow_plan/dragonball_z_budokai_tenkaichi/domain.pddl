(define (domain dragonball_z_budokai_tenkaichi)
  (:requirements :strips :typing)
  (:types
    player vs_duel character stage location
  )

  (:predicates
    (vs_duel_selected ?duel - vs_duel)
    (player_selected ?player - player)
    (character_selected ?player - player ?character - character)
    (stage_specified ?stage - stage)
    (present ?character - character)
    (located ?player - player ?loc - location)
    (against_wall ?player - player)
    (separated ?player1 - player ?player2 - player)
  )

  ;; 选择 VS Duel 模式
  (:action select_vs_duel
    :parameters (?duel - vs_duel)
    :precondition (not (vs_duel_selected ?duel))
    :effect (vs_duel_selected ?duel)
  )

  ;; 选择玩家
  (:action select_player
    :parameters (?player - player)
    :precondition (not (player_selected ?player))
    :effect (player_selected ?player)
  )

  ;; 为玩家选择角色
  (:action select_character
    :parameters (?player - player ?character - character)
    :precondition (and (present ?character) (not (character_selected ?player ?character)))
    :effect (character_selected ?player ?character)
  )

  ;; 指定舞台
  (:action specify_stage
    :parameters (?stage - stage)
    :precondition (not (stage_specified ?stage))
    :effect (stage_specified ?stage)
  )

  ;; 移动玩家到墙边并分离
  (:action move_to_wall
    :parameters (?player1 - player ?player2 - player ?loc1 - location ?loc2 - location)
    :precondition (and
                    (located ?player1 ?loc1)
                    (located ?player2 ?loc2)
                    (vs_duel_selected duel1)
                    (character_selected ?player1 goku)
                    (character_selected ?player2 goku))
    :effect (and
              (located ?player1 against_wall)
              (located ?player2 against_wall)
              (against_wall ?player1)
              (against_wall ?player2)
              (separated ?player1 ?player2)
            )
  )
)
