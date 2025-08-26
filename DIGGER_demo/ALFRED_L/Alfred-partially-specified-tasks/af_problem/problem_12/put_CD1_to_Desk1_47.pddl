(define (problem put_CD1_to_Desk1_47)
  (:domain put_task)
  (:objects
    agent1 - agent
    CellPhone1 - object
    Box1 - receptacle
    Pillow1 - object
    Pencil1 - object
    CreditCard2 - object
    CellPhone2 - object
    CD1 - object
    AlarmClock2 - object
    AlarmClock1 - object
    Pen1 - object
    CreditCard1 - object
    Desk3 - receptacle
    Box2 - receptacle
    Box3 - receptacle
    Sofa2 - receptacle
    Desk4 - receptacle
    Desk1 - receptacle
    Sofa1 - receptacle
    Box4 - receptacle
    Desk5 - receptacle
    Desk2 - receptacle
    KeyChain1 - object
    KeyChain2 - object
    KeyChain3 - object
    Book1 - object
    Book2 - object
  )

  (:init
    (atLocation agent1 Desk3)
    (objectAtLocation CellPhone1 Desk1)
    (objectAtLocation CD1 Desk2)
    (objectAtLocation CreditCard2 Desk3)
    (objectAtLocation AlarmClock2 Desk4)
    (objectAtLocation Pillow1 Sofa2)
    (objectAtLocation Pencil1 Desk5)
    (objectAtLocation Book1 Desk1)
    (objectAtLocation Book2 Box3)
    (objectAtLocation KeyChain2 Box2)
    (objectAtLocation KeyChain1 Box1)
    (objectAtLocation KeyChain3 Box1)
  )

  (:goal
    (and
      (objectAtLocation CD1 Desk1)
    )
  )
)
