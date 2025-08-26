(define (problem put_CellPhone1_on_the_Sofa1_Do_not_put_it_in_Box4_79)
  (:domain put_task)
  (:objects
agent1 - agent    Pen2 - object
    CellPhone3 - object
    AlarmClock1 - object
    Laptop1 - object
    Laptop2 - object
    KeyChain1 - object
    Book1 - object
    Watch1 - object
    CreditCard2 - object
    Pen1 - object
    CreditCard1 - object
    CellPhone2 - object
    Box1 - receptacle_object
    Pencil1 - object
    CellPhone1 - object
    Sofa2 - receptacle
    Sofa1 - receptacle
    Desk5 - receptacle
    Sofa3 - receptacle
    Desk4 - receptacle
    Desk2 - receptacle
    Box3 - receptacle_object
    Sofa4 - receptacle
    Bed1 - receptacle
    Desk1 - receptacle
    Desk3 - receptacle
    Bed2 - receptacle
    Box2 - receptacle_object
    Desk6 - receptacle
    Box4 - receptacle_object
  )

  (:init
    (atLocation agent1 Sofa3)
    (objectAtLocation CellPhone1 Sofa2)
    (objectAtLocation CreditCard1 Sofa3)
    (objectAtLocation Watch1 Desk1)
    (objectAtLocation Book1 Sofa4)
    (objectAtLocation Pencil1 Desk2)
    (objectAtLocation CellPhone3 Bed1)
    (objectAtLocation Pen1 Desk3)
    (objectAtLocation AlarmClock1 Desk4)
    (objectAtLocation Laptop1 Desk6)
    (objectAtLocation Laptop2 Bed2)
    (objectAtLocation KeyChain1 Box3)
    (objectAtLocation Box3 Box4)
    (objectAtLocation Box1 Sofa2)
    (objectAtLocation Box2 Sofa2)
    (objectAtLocation Box4 Sofa1)
  )

  (:goal
    (and
      (objectAtLocation CellPhone1 Sofa1)
      (objectAtLocation KeyChain1 Sofa1)
      (not (objectAtLocation CellPhone1 Box4))
      (not (objectAtLocation CellPhone1 Box3))
      (not (objectAtLocation KeyChain1 Box4))
      (not (objectAtLocation KeyChain1 Box3))
    )
  )
)
