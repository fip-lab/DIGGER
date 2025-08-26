(define (problem ninja_defuse)
  (:domain call_of_duty)

  (:objects
    character - game_character
    current_routes - routes
    game_bomb - bomb
    player_pistol - pistol
    further_out in hidden now_at_bomb - place
    uncovered covered uninvestigated investigated - state
    pulling_out_pistol investigating waiting defusing - task
    in_inventory equipped concealed exposed - state
    planted defused - state
  )

  (:init
    ;; 游戏角色初始位置
    (location character further_out)

    ;; 游戏角色的初始任务
    (focus character pulling_out_pistol)

    ;; 路线的初始状态
    (coverage current_routes uncovered)
    (appearance current_routes uncovered)
    (knowledge current_routes uninvestigated)

    ;; 炸弹的初始状态
    (skill game_bomb unplanted)

    ;; 手枪的初始状态
    (pistol_location player_pistol concealed)
    (availability player_pistol in_inventory)
  )

  (:goal
    (and
      ;; 游戏角色最终位置和任务
      (location character now_at_bomb)
      (focus character defusing)

      ;; 炸弹被拆除
      (skill game_bomb defused)
    )
  )
)
