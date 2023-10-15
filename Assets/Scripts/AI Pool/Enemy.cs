using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;
using Redcode.Pools;

public class Enemy : MonoBehaviour 
{
    public enum Type {A, B, C};
    public Type enemyType;
   
    public Transform target;
    NavMeshAgent ai;
    Rigidbody rigid;
    BoxCollider boxCollider;

    public ParticleSystem muzzleFlashs;

    public BoxCollider meleeArea;

    public bool isAttack;

    public Animator anim;

    public bool isChase;

    private PlayerController player;

    public GameManager gameManager;

    public StatusController statusController;

    NavMeshAgent nav;

   
    [SerializeField]
    private int Hp;

    private int currentHp;

    [SerializeField]
    
    private string monsterAtt;


    void FreezeVelocity()
    {
        if(isChase)
        {
            rigid.velocity = Vector3.zero;
            rigid.angularVelocity = Vector3.zero;
        }
 
    }


    void FixedUpdate()
    {
        FreezeVelocity();
        Targerting();

    }

    private void Start()
    {
        player = FindObjectOfType<PlayerController>();
    }



    void Awake()
    {
        rigid = GetComponent<Rigidbody>();
        boxCollider = GetComponent<BoxCollider>();
        ai = GetComponent<NavMeshAgent>();
        anim = GetComponentInChildren<Animator>();
        nav = GetComponent<NavMeshAgent>();

        Invoke("ChaseStart", 2);
       
        currentHp = Hp;
  
        Invoke("ChaseStart", 2);

    }

    void ChaseStart()
    {
        isChase = true;
        anim.SetBool("isWalk", true);


    }

    void Update()
    {
        if(nav.enabled)
        {
            nav.SetDestination(target.position);
            nav.isStopped = !isChase;
        }

    }

    void Targerting()
    {
        float targetRadius = 1.5f;
        float targetRange = 3f;

        switch (enemyType){
            case Type.A :
            targetRadius = 1.5f;
            targetRange = 3f;
            break;
            case Type.B :
            targetRadius = 1.5f;
            targetRange = 6f;
            break;
            case Type.C:
            
            break;
        }

        RaycastHit[] rayHits =
        Physics.SphereCastAll(transform.position,
        targetRadius,
        transform.forward,
        targetRange,
        LayerMask.GetMask("Player"));

        if(rayHits.Length > 0 && !isAttack)
        {
            StartCoroutine(Attack());
        }



    }

    IEnumerator Attack()
    {
        isChase = false;
        isAttack = true;
        anim.SetBool("isAttack", true);
        SoundManager.instance.PlaySE(monsterAtt);

        switch(enemyType) {
            case Type.A:
            yield return new WaitForSeconds(0.2f);
            meleeArea.enabled = true;

            yield return new WaitForSeconds(0.5f);
            meleeArea.enabled = false;

            yield return new WaitForSeconds(0.5f);
            isChase = false;

            break;
            case Type.B:
            break;
            case Type.C:
            break;
        }
    

        isChase = true;
        isAttack = false;
        anim.SetBool("isAttack", false);
        
    }

    void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player") && isAttack) // 플레이어 태그와 공격 중인지 확인
        {
            statusController.DecreaseHP(20);
        }
    }


    public void TakeDamage(int damage)
    {
        currentHp -= damage;
        isChase = false;
        player.AddHitScore(20);

        // 체력이 0 이하로 떨어지면 몬스터 등록수를 -한후  파괴
        if (currentHp <= 0)
        {
            switch(enemyType){
                case Type.A:
                gameManager.enemyCntA--;
                break;
                case Type.B:
                gameManager.enemyCntA--;
                break;
                case Type.C:
                gameManager.enemyCntA--;
                break;
            }
            Die();
        }

        anim.SetTrigger("Hit");

        StartCoroutine(ResumeChaseAfterDelay(1f));
   
    }

    private IEnumerator ResumeChaseAfterDelay(float delay)
    {
        anim.SetTrigger("Hit");
        yield return new WaitForSeconds(delay);
        isChase = true;
    }





    private void Die()
    {
        Destroy(gameObject);
        player.AddScore(20);
        player.AddKillcount(1);
       
    }


 
}
