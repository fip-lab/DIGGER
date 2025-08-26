(define (problem put_Book1_on_the_Sofa1_Do_not_put_it_in_Box2_78)
  (:domain put_task)
  (:objects
agent1 - agent    Book2 - object
    Pen2 - object
    AlarmClock1 - object
    KeyChain2 - object
    KeyChain1 - object
    Book1 - object
    CD2 - object
    Pen1 - object
    CreditCard1 - object
    CD1 - object
    Sofa1 - receptacle
    Drawer3 - receptacle
    Drawer1 - receptacle
    Drawer2 - receptacle
    Box3 - receptacle_object
    Desk2 - receptacle
    Desk1 - receptacle
    Drawer4 - receptacle
    Box1 - receptacle_object
    Box2 - receptacle_object
    Pencil1 - object
    Box4 - receptacle_object
    Sofa2 - receptacle
    Sofa3 - receptacle
  )

  (:init
    (atLocation agent1 Drawer2)
    (objectAtLocation Book1 Drawer1)
    (objectAtLocation CD1 Drawer2)
    (objectAtLocation Book2 Sofa1)
    (objectAtLocation Pen2 Drawer3)
    (objectAtLocation CD2 Desk1)
    (objectAtLocation CreditCard1 Desk2)
    (objectAtLocation Pencil1 Sofa1)
    (objectAtLocation KeyChain1 Box1)
    (objectAtLocation Box1 Box2)
    (objectAtLocation Box2 Sofa1)
    (objectAtLocation Box3 Sofa2)
    (objectAtLocation Box4 Sofa3)
  )

  (:goal
    (and
      (objectAtLocation Book1 Sofa1)
      (objectAtLocation KeyChain1 Sofa1)
      (not (objectAtLocation Book1 Box2))
      (not (objectAtLocation Book1 Box1))
      (not (objectAtLocation KeyChain1 Box2))
      (not (objectAtLocation KeyChain1 Box1))
    )
  )
)
