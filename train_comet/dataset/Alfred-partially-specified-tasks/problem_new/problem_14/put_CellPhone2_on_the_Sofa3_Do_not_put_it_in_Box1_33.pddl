(define (problem put_CellPhone2_on_the_Sofa3_Do_not_put_it_in_Box1_33)
  (:domain put_task)
  (:objects
agent1 - agent    Book2 - object
    AlarmClock1 - object
    CD1 - object
    Pencil2 - object
    KeyChain2 - object
    CellPhone1 - object
    KeyChain1 - object
    Book1 - object
    CreditCard1 - object
    CellPhone2 - object
    Pencil1 - object
    CellPhone3 - object
    Sofa2 - receptacle
    Sofa1 - receptacle
    Desk5 - receptacle
    Sofa3 - receptacle
    Desk4 - receptacle
    Desk2 - receptacle
    Desk3 - receptacle
    Bed1 - receptacle
    Desk1 - receptacle
    GarbageCan2 - receptacle
    Box1 - receptacle_object
    GarbageCan1 - receptacle
    Box2 - receptacle_object
    Box3 - receptacle_object
    Box4 - receptacle_object
  )

  (:init
    (atLocation agent1 Sofa2)
    (objectAtLocation CellPhone2 Desk1)
    (objectAtLocation CellPhone3 Sofa2)
    (objectAtLocation CreditCard1 Desk2)
    (objectAtLocation KeyChain1 Desk3)
    (objectAtLocation AlarmClock1 Desk4)
    (objectAtLocation CD1 GarbageCan1)
    (objectAtLocation Pencil1 GarbageCan2)
    (objectAtLocation Pencil2 Desk5)
    (objectAtLocation KeyChain2 Sofa3)
    (objectAtLocation Book2 Bed1)
    (objectAtLocation Book1 Box4)
    (objectAtLocation Box4 Box1)
    (objectAtLocation Box1 Sofa3)
    (objectAtLocation Box2 Sofa1)
    (objectAtLocation Box3 Sofa1)
  )

  (:goal
    (and
      (objectAtLocation CellPhone2 Sofa3)
      (objectAtLocation Book1 Sofa3)
      (not (objectAtLocation CellPhone2 Box1))
      (not (objectAtLocation CellPhone2 Box4))
      (not (objectAtLocation Book1 Box1))
      (not (objectAtLocation Book1 Box4))
    )
  )
)
