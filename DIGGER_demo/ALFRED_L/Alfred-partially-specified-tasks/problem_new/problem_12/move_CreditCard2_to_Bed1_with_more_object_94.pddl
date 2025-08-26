(define (problem move_CreditCard2_to_Bed1_with_more_object_94)
  (:domain put_task)
  (:objects
    agent1 - agent
    CellPhone1 - object
    Box1 - receptacle
    Pillow1 - object
    KeyChain1 - object
    CreditCard2 - object
    Pencil1 - object
    CD1 - object
    AlarmClock1 - object
    Pen1 - object
    CreditCard1 - object
    Bed1 - receptacle
    Drawer1 - receptacle
    Box2 - receptacle
    Box3 - receptacle
    Drawer4 - receptacle
    Sofa1 - receptacle
    Desk1 - receptacle
    Drawer3 - receptacle
    Drawer2 - receptacle
    Laptop1 - object
    Laptop2 - object
    Laptop3 - object
    Pencil2 - object
    Sofa2 - receptacle
  )

  (:init
    (atLocation agent1 Drawer2)
    (objectAtLocation CreditCard2 Drawer1)
    (objectAtLocation CD1 Drawer2)
    (objectAtLocation Pillow1 Bed1)
    (objectAtLocation Pencil1 Drawer3)
    (objectAtLocation CellPhone1 Drawer4)
    (objectAtLocation Pen1 Desk1)
    (objectAtLocation Pencil2 Bed1)
    (objectAtLocation Laptop1 Box2)
    (objectAtLocation Laptop3 Box1)
    (objectAtLocation Laptop2 Box1)
  )

  (:goal
    (and
      (objectAtLocation CreditCard2 Bed1)
    )
  )
)
