(define (problem board-a-small-boat-problem)
  (:domain board-a-small-boat)

  (:objects
    passenger1 passenger2 - passenger
    platform1 - platform
    dock1 - dock
    boat1 - boat
  )

  (:init
    ;; 初始位置
    (at passenger1 platform1)
    (at platform1 dock1)
    (at boat1 dock1)

    ;; 平台存在
    (platform-present platform1)

    ;; 初始状态
    (not (holding-rail passenger1))
    (not (legs-in-boat passenger1))
    (not (centered boat1))
    (not (crouched passenger1))
    (not (boat-stable boat1))
    (not (boat-moving boat1))

    ;; 乘客2未参与
    (not (at passenger2 boat1))
  )

  (:goal
    (and
      ;; 乘客1已登船
      (at passenger1 boat1)

      ;; 双腿在船内
      (legs-in-boat passenger1)

      ;; 持握扶手
      (holding-rail passenger1)

      ;; 船只已居中且稳定
      (centered boat1)
      (boat-stable boat1)

      ;; 乘客1已蹲下
      (crouched passenger1)
    )
  )
)
