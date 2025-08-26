(define (problem move_CD1_to_Desk4_with_more_object_51)
  (:domain put_task)
  (:objects
    agent1 - agent
    CellPhone1 - object
    Box1 - receptacle
    Book2 - object
    Laptop1 - object
    Book3 - object
    KeyChain1 - object
    CreditCard2 - object
    Pencil1 - object
    CellPhone2 - object
    CD1 - object
    CD2 - object
    AlarmClock1 - object
    CellPhone3 - object
    Book1 - object
    CreditCard1 - object
    Drawer1 - receptacle
    Bed1 - receptacle
    Box2 - receptacle
    Box3 - receptacle
    Desk3 - receptacle
    Sofa4 - receptacle
    Sofa3 - receptacle
    Sofa2 - receptacle
    Bed2 - receptacle
    Desk4 - receptacle
    Sofa1 - receptacle
    Desk1 - receptacle
    Drawer2 - receptacle
    Desk2 - receptacle
    Pencil2 - object
    Pencil3 - object
  )

  (:init
    (atLocation agent1 Sofa1)
    (objectAtLocation CD1 Desk1)
    (objectAtLocation CellPhone1 Sofa1)
    (objectAtLocation CreditCard1 Drawer1)
    (objectAtLocation CellPhone2 Bed1)
    (objectAtLocation AlarmClock1 Desk2)
    (objectAtLocation Laptop1 Bed2)
    (objectAtLocation CreditCard2 Sofa3)
    (objectAtLocation Book2 Sofa4)
    (objectAtLocation Book3 Drawer2)
    (objectAtLocation CellPhone3 Desk4)
    (objectAtLocation Book1 Desk4)
    (objectAtLocation Pencil2 Box1)
    (objectAtLocation Pencil1 Box2)
    (objectAtLocation Pencil3 Box2)
  )

  (:goal
    (and
      (objectAtLocation CD1 Desk4)
    )
  )
)
