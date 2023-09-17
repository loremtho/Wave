using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;
using Redcode.Pools;

public class Enemy : MonoBehaviour //, IPoolObject 풀링 임시
{

    /* 풀링 예제
    public string idName;
    public Vector3 targetpos;
    public Animator anim;
    bool isAtDestination;
    Material mat;
    */

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
        //mat = GetComponentInChildren<MeshRenderer>().material;
        
       

    }

    void Update()
    {
        ai.SetDestination(target.position); //추적코드

        /*풀링 임시
        Vector3 relVelocity = transform.InverseTransformDirection(ai.velocity);
        relVelocity.y = 0;

        anim.SetFloat("Idle" , relVelocity.magnitude / anim.transform.lossyScale.x);
        

        if(ai.remainingDistance <2f)
        {
            if(!isAtDestination)
            {
                OnTargetReached();

                isAtDestination = true;
            }
        }
        else
        {
            isAtDestination = false;
        }
        */

    }

    /*풀링 임시
    void OnTargetReached()
    {
        GameManager.instance.ReturnPool(this);
    }

    void OnEnable() 
    {
        Init();
    }

    void Init()
    {
        transform.position = new Vector3(Random.Range(-2f , 2f), 0.7f, Random.Range(-2f, 2f));
        Transform[] spawnPos = GameManager.instance.points;
        ai.SetDestination(spawnPos[Random.Range(0, spawnPos.Length)].position);
    }

    public void OnCreatedInPool()
    {
        
    }

    public void OnGettingFromPool()
    {
        Init();
    }
    */
}
