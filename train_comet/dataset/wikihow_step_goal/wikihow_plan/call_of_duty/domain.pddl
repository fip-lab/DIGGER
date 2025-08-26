(define (domain call_of_duty)
  (:requirements :strips :typing)
  (:types
    game_character
    routes
    bomb
    pistol
    place
    state
    task
  )

  (:predicates
    ;; 游戏角色的位置
    (location ?c - game_character ?p - place)

    ;; 游戏角色的当前任务
    (focus ?c - game_character ?t - task)

    ;; 路线的覆盖状态
    (coverage ?r - routes ?s - state)

    ;; 路线的外观状态
    (appearance ?r - routes ?s - state)

    ;; 路线的知识状态
    (knowledge ?r - routes ?s - state)

    ;; 炸弹的技能状态
    (skill ?b - bomb ?s - state)

    ;; 手枪的位置状态
    (pistol_location ?p - pistol ?s - state)

    ;; 手枪的可用性状态
    (availability ?p - pistol ?s - state)
  )

  ;; 动作1: 移动并覆盖路线到炸弹地点
  (:action move_in
    :parameters (?c - game_character ?r - routes ?from - place ?to - place)
    :precondition (and
                    (location ?c ?from)
                    (coverage ?r uncovered)
                    (appearance ?r uncovered))
    :effect (and
             (location ?c ?to)
             (coverage ?r covered)
             (appearance ?r covered))
  )

  ;; 动作2: 找到隐藏点并拔出手枪
  (:action find_hiding_spot
    :parameters (?c - game_character ?p - pistol ?ps - place)
    :precondition (and
                    (location ?c ?ps)
                    (pistol_location ?p concealed)
                    (availability ?p in_inventory))
    :effect (and
             (location ?c hidden)
             (pistol_location ?p exposed)
             (availability ?p equipped))
  )

  ;; 动作3: 调查敌人的路线
  (:action investigate_routes
    :parameters (?c - game_character ?r - routes)
    :precondition (and
                    (location ?c hidden)
                    (focus ?c pulling_out_pistol)
                    (knowledge ?r uninvestigated))
    :effect (and
             (focus ?c investigating)
             (knowledge ?r investigated))
  )

  ;; 动作4: 等待敌人开始安装炸弹
  (:action wait_until_planting
    :parameters (?c - game_character ?b - bomb)
    :precondition (and
                    (focus ?c investigating)
                    (skill ?b unplanted))
    :effect (and
             (focus ?c waiting)
             (skill ?b planted))
  )

  ;; 动作5: 炸弹被安装后开始拆除
  (:action start_defusing
    :parameters (?c - game_character ?b - bomb)
    :precondition (and
                    (location ?c hidden)
                    (focus ?c waiting)
                    (skill ?b planted))
    :effect (and
             (location ?c now_at_bomb)
             (focus ?c defusing)
             (skill ?b defused))
  )
)
