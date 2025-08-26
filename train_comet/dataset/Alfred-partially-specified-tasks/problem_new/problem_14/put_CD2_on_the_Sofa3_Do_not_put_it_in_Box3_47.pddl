(define (problem put_CD2_on_the_Sofa3_Do_not_put_it_in_Box3_47)
  (:domain put_task)
  (:objects
agent1 - agent    AlarmClock1 - object
    CD1 - object
    Watch2 - object
    CellPhone1 - object
    KeyChain1 - object
    Watch1 - object
    Pen1 - object
    CreditCard1 - object
    Laptop1 - object
    Box1 - receptacle_object
    CD3 - object
    Pencil1 - object
    CD2 - object
    Desk5 - receptacle
    Sofa1 - receptacle
    Sofa2 - receptacle
    Drawer1 - receptacle
    Drawer2 - receptacle
    Box3 - receptacle_object
    Desk2 - receptacle
    Desk4 - receptacle
    Desk3 - receptacle
    Desk1 - receptacle
    Box2 - receptacle_object
    GarbageCan1 - receptacle
    Book1 - object
    Box4 - receptacle_object
    Sofa3 - receptacle
  )

  (:init
    (atLocation agent1 Drawer1)
    (objectAtLocation CD2 GarbageCan1)
    (objectAtLocation Watch1 Drawer1)
    (objectAtLocation CellPhone1 Sofa1)
    (objectAtLocation Pen1 Desk1)
    (objectAtLocation CD3 Desk2)
    (objectAtLocation Watch2 Desk4)
    (objectAtLocation Laptop1 Desk5)
    (objectAtLocation CreditCard1 Drawer2)
    (objectAtLocation Book1 Desk1)
    (objectAtLocation Pencil1 Box4)
    (objectAtLocation Box4 Box3)
    (objectAtLocation Box1 Sofa1)
    (objectAtLocation Box2 Sofa3)
    (objectAtLocation Box3 Sofa3)
  )

  (:goal
    (and
      (objectAtLocation CD2 Sofa3)
      (objectAtLocation Pencil1 Sofa3)
      (not (objectAtLocation CD2 Box3))
      (not (objectAtLocation CD2 Box4))
      (not (objectAtLocation Pencil1 Box3))
      (not (objectAtLocation Pencil1 Box4))
    )
  )
)
