(define (problem move_Pen1_to_Box1_with_two_object_73)
  (:domain put_task)
  (:objects
    agent1 - agent
    Box1 - receptacle
    Box2 - receptacle
    Book2 - object
    Watch1 - object
    Pillow1 - object
    Watch2 - object
    Pencil1 - object
    CD1 - object
    CD2 - object
    AlarmClock1 - object
    Book1 - object
    Pen1 - object
    CreditCard1 - object
    Bed1 - receptacle
    Drawer1 - receptacle
    Desk3 - receptacle
    Desk7 - receptacle
    Desk4 - receptacle
    Desk1 - receptacle
    Sofa1 - receptacle
    GarbageCan1 - receptacle
    Desk5 - receptacle
    Desk6 - receptacle
    Desk2 - receptacle
    Book3 - object
    Laptop1 - object
    Laptop2 - object
    Sofa2 - receptacle
  )

  (:init
    (atLocation agent1 Desk4)
    (objectAtLocation Pillow1 Bed1)
    (objectAtLocation Pencil1 GarbageCan1)
    (objectAtLocation Pen1 Desk3)
    (objectAtLocation CreditCard1 Desk4)
    (objectAtLocation AlarmClock1 Desk5)
    (objectAtLocation CD2 Desk6)
    (objectAtLocation Watch2 Desk7)
    (objectAtLocation Laptop1 GarbageCan1)
    (objectAtLocation Laptop2 Bed1)
    (objectAtLocation Book2 Box1)
    (objectAtLocation Book3 Box2)
    (objectAtLocation Book1 Box1)
  )

  (:goal
    (and
      (objectAtLocation Pen1 Box1)
    )
  )
)
