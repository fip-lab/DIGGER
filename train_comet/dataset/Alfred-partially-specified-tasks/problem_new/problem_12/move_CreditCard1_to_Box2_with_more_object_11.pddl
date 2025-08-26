(define (problem move_CreditCard1_to_Box2_with_more_object_11)
  (:domain put_task)
  (:objects
    agent1 - agent
    CellPhone1 - object
    Box1 - receptacle
    Laptop2 - object
    Book2 - object
    Pen2 - object
    Laptop1 - object
    Watch1 - object
    Watch2 - object
    AlarmClock1 - object
    Book1 - object
    Pen1 - object
    CreditCard1 - object
    Drawer1 - receptacle
    Bed1 - receptacle
    Box2 - receptacle
    Box3 - receptacle
    Desk3 - receptacle
    Sofa2 - receptacle
    Desk1 - receptacle
    Sofa1 - receptacle
    Box4 - receptacle
    Drawer2 - receptacle
    Desk2 - receptacle
    Laptop3 - object
    Pencil1 - object
    Pencil2 - object
  )

  (:init
    (atLocation agent1 Desk2)
    (objectAtLocation CreditCard1 Drawer1)
    (objectAtLocation AlarmClock1 Desk2)
    (objectAtLocation Book1 Bed1)
    (objectAtLocation Watch2 Drawer2)
    (objectAtLocation Pen2 Desk3)
    (objectAtLocation Pencil1 Box2)
    (objectAtLocation Pencil2 Box2)
    (objectAtLocation Laptop2 Box2)
    (objectAtLocation Laptop3 Box2)
    (objectAtLocation Laptop1 Box1)
  )

  (:goal
    (and
      (objectAtLocation CreditCard1 Box2)
    )
  )
)
