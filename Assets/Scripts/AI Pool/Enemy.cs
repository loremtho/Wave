using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

public class Enemy : MonoBehaviour 
{

  

    //public int score; 구현 예정 임시 점수나 재화등

    public Transform target;
    NavMeshAgent ai;
    Rigidbody rigid;
    BoxCollider boxCollider;



    void Awake()
    {
        rigid = GetComponent<Rigidbody>();
        boxCollider = GetComponent<BoxCollider>();
        ai = GetComponent<NavMeshAgent>();
      
        
       

    }

    void Update()
    {
        ai.SetDestination(target.position); //추적코드

  

    }

 
}
