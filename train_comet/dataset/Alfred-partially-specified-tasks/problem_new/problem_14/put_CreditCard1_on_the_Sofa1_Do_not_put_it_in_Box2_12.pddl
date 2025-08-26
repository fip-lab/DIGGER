(define (problem put_CreditCard1_on_the_Sofa1_Do_not_put_it_in_Box2_12)
  (:domain put_task)
  (:objects
agent1 - agent    Book2 - object
    Box1 - receptacle_object
    AlarmClock1 - object
    CD1 - object
    KeyChain1 - object
    Book1 - object
    Pen1 - object
    CreditCard1 - object
    CreditCard2 - object
    Pencil1 - object
    CellPhone1 - object
    Desk5 - receptacle
    Sofa1 - receptacle
    Sofa2 - receptacle
    Desk4 - receptacle
    Desk2 - receptacle
    Desk3 - receptacle
    Bed1 - receptacle
    Desk1 - receptacle
    Box2 - receptacle_object
    GarbageCan1 - receptacle
    Box3 - receptacle_object
    Box4 - receptacle_object
    Sofa3 - receptacle
  )

  (:init
    (atLocation agent1 GarbageCan1)
    (objectAtLocation CreditCard1 Sofa1)
    (objectAtLocation Pencil1 GarbageCan1)
    (objectAtLocation CellPhone1 Desk2)
    (objectAtLocation Pen1 Desk3)
    (objectAtLocation Book2 Bed1)
    (objectAtLocation CD1 Desk5)
    (objectAtLocation KeyChain1 Sofa2)
    (objectAtLocation AlarmClock1 Box1)
    (objectAtLocation Box1 Box2)
    (objectAtLocation Box2 Sofa1)
    (objectAtLocation Box3 Sofa1)
    (objectAtLocation Box4 Sofa3)
  )

  (:goal
    (and
      (objectAtLocation CreditCard1 Sofa1)
      (objectAtLocation AlarmClock1 Sofa1)
      (not (objectAtLocation CreditCard1 Box2))
      (not (objectAtLocation CreditCard1 Box1))
      (not (objectAtLocation AlarmClock1 Box2))
      (not (objectAtLocation AlarmClock1 Box1))
    )
  )
)
