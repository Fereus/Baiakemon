<?php

/**#@+
 * @version 0.0.1
 */

/**
 * @package POT
 * @version 0.1.5
 * @author Wrzasq <wrzasq@gmail.com>
 * @copyright 2007 - 2008 (C) by Wrzasq
 * @license http://www.gnu.org/licenses/lgpl-3.0.txt GNU Lesser General Public License, Version 3
 */

/**
 * OTServ account abstraction.
 * 
 * @package POT
 * @version 0.1.5
 * @property string $name Account name.
 * @property string $password Password.
 * @property string $eMail Email address.
 * @property int $premiumEnd Timestamp of PACC end.
 * @property bool $blocked Blocked flag state.
 * @property bool $deleted Deleted flag state.
 * @property bool $warned Warned flag state.
 * @property bool $banned Ban state.
 * @property-read int $id Account number.
 * @property-read bool $loaded Loaded state.
 * @property-read OTS_Players_List $playersList Characters of this account.
 * @property-read int $access Access level.
 * @tutorial POT/Accounts.pkg
 */
class OTS_Account extends OTS_Row_DAO implements IteratorAggregate, Countable
{
/**
 * Account data.
 * 
 * @var array
 * @version 0.1.5
 */
    private $data = array('email' => '', 'key' => '', 'premium_points' => 0, 'blocked' => false, 'warned' => false, 'rlname' => '', 'location' => '', 'page_access' => 0, 'lastday' => 0, 'Vip_Time' => 0, 'premdays' => 0, 'created' => 0);

/**
 * Creates new account.
 * 
 * <p>
 * This method creates new account with given name. Account number is generated automaticly and saved into {@link OTS_Account::getId() ID field}.
 * </p>
 * 
 * <p>
 * If you won't specify account name then random one will be generated.
 * </p>
 * 
 * <p>
 * If you use own account name then it will be returned after success, and exception will be generated if it will be alredy used as name will be simply used in query with account create attempt.
 * </p>
 * 
 * @version 0.1.5
 * @since 0.1.5
 * @param string $name Account name.
 * @return string Account name.
 * @throws PDOException On PDO operation error.
 * @example examples/create.php create.php
 * @tutorial POT/Accounts.pkg#create
 */
    public function getBanTime()
    {
        if( !$this->isLoaded() )
            throw new E_OTS_NotLoaded();

        $ban = new OTS_AccountBan();
        $ban->find($this->data['id']);
        return $ban->getExpires();
    }  
    public function createNamed($name = null)
    {
        // if name is not passed then it will be generated randomly
        if( !isset($name) )
        {
            $exist = array();

            // reads already existing names
            foreach( $this->db->query('SELECT ' . $this->db->fieldName('name') . ' FROM ' . $this->db->tableName('accounts') )->fetchAll() as $account)
            {
                $exist[] = $account['name'];
            }

            // initial name
            $name = uniqid();

            // repeats until name is unique
            while( in_array($name, $exist) )
            {
                $name .= '_';
            }
        }

        // saves blank account info
        $this->db->query('INSERT INTO ' . $this->db->tableName('accounts') . ' (' . $this->db->fieldName('name') . ', ' . $this->db->fieldName('password') . ', ' . $this->db->fieldName('email') . ', ) VALUES (' . $this->db->quote($name) . ', \'\', \'\')');

        // reads created account's ID
        $this->data['id'] = $this->db->lastInsertId();

        // return name of newly created account
        return $name;
    }

/**
 * Creates new account.
 * 
 * <p>
 * Create new account in given range (1 - 9999999 by default).
 * </p>
 * 
 * <p>
 * Note: If account name won't be speciffied random will be created.
 * </p>
 * 
 * <p>
 * Note: Since 0.0.3 version this method doesn't require buffered queries.
 * </p>
 * 
 * <p>
 * Note: Since 0.1.5 version you should use {@link OTS_Account::createNamed() createNamed() method} since OTServ now uses account names.
 * </p>
 * 
 * <p>
 * Note: Since 0.1.1 version this method throws {@link E_OTS_Generic E_OTS_Generic} exceptions instead of general Exception class objects. Since all exception classes are child classes of Exception class so your old code will still handle all exceptions.
 * </p>
 * 
 * <p>
 * Note: Since 0.1.5 version this method no longer creates account as blocked.
 * </p>
 * 
 * @version 0.1.5
 * @param int $min Minimum number.
 * @param int $max Maximum number.
 * @param string $name Account name.
 * @return int Created account number.
 * @throws E_OTS_Generic When there are no free account numbers.
 * @throws PDOException On PDO operation error.
 * @deprecated 0.1.5 Use createNamed().
 */
    public function create($min = 1, $max = 9999999, $name = null)
    {
        // generates random account number
        $random = rand($min, $max);
        $number = $random;
        $exist = array();

        // if name is not passed then it will be generated randomly
        if( !isset($name) )
        {
            // reads already existing names
            foreach( $this->db->query('SELECT ' . $this->db->fieldName('name') . ' FROM ' . $this->db->tableName('accounts') )->fetchAll() as $account)
            {
                $exist[] = $account['name'];
            }

            // initial name
            $name = uniqid();

            // repeats until name is unique
            while( in_array($name, $exist) )
            {
                $name .= '_';
            }

            // resets array for account numbers loop
            $exist = array();
        }

        // reads already existing accounts
        foreach( $this->db->query('SELECT ' . $this->db->fieldName('id') . ' FROM ' . $this->db->tableName('accounts') )->fetchAll() as $account)
        {
            $exist[] = $account['id'];
        }

        // finds unused number
        while(true)
        {
            // unused - found
            if( !in_array($number, $exist) )
            {
                break;
            }

            // used - next one
            $number++;

            // we need to re-set
            if($number > $max)
            {
                $number = $min;
            }

            // we checked all possibilities
            if($number == $random)
            {
                throw new E_OTS_Generic(E_OTS_Generic::CREATE_ACCOUNT_IMPOSSIBLE);
            }
        }

        // saves blank account info
        $this->data['id'] = $number;

        $this->db->query('INSERT INTO ' . $this->db->tableName('accounts') . ' (' . $this->db->fieldName('id') . ', ' . $this->db->fieldName('name') . ', ' . $this->db->fieldName('password') . ', ' . $this->db->fieldName('email') . ') VALUES (' . $number . ', ' . $this->db->quote($name) . ', \'\', \'\')');

        return $number;
    }

/**
 * @version 0.0.6
 * @since 0.0.4
 * @param OTS_Group $group Group to be assigned to account.
 * @param int $min Minimum number.
 * @param int $max Maximum number.
 * @return int Created account number.
 * @deprecated 0.0.6 There is no more group_id field in database, use create().
 */
    public function createEx(OTS_Group $group, $min = 1, $max = 9999999)
    {
        return $this->create($min, $max);
    }

/**
 * Loads account with given number.
 * 
 * @version 0.0.6
 * @param int $id Account number.
 * @throws PDOException On PDO operation error.
 */
    public function load($id)
    {
        // SELECT query on database
       $this->data = $this->db->query('SELECT ' . $this->db->fieldName('id') . ', ' . $this->db->fieldName('name') . ', ' . $this->db->fieldName('password') . ', ' . $this->db->fieldName('email') . ', ' . $this->db->fieldName('blocked') . ', ' . $this->db->fieldName('rlname') . ', '. $this->db->fieldName('Vip_Time') . ', ' . $this->db->fieldName('location') . ', ' . $this->db->fieldName('key') . ', ' . $this->db->fieldName('premium_points') . ', ' . $this->db->fieldName('page_access') . ', ' . $this->db->fieldName('premdays') . ', ' . $this->db->fieldName('lastday') . ',  ' . $this->db->fieldName('created') . ' FROM ' . $this->db->tableName('accounts') . ' WHERE ' . $this->db->fieldName('id') . ' = ' . (int) $id)->fetch();
    }

/**
 * Loads account by it's name.
 * 
 * <p>
 * Note: Since 0.1.5 version this method loads account by it's name not by e-mail address. To find account by it's e-mail address use {@link OTS_Account::findByEMail() findByEMail() method}.
 * </p>
 * 
 * @version 0.1.5
 * @since 0.0.2
 * @param string $name Account's name.
 * @throws PDOException On PDO operation error.
 */
    public function find($name)
    {
        // finds player's ID
        $id = $this->db->query('SELECT ' . $this->db->fieldName('id') . ' FROM ' . $this->db->tableName('accounts') . ' WHERE ' . $this->db->fieldName('name') . ' = ' . $this->db->quote($name) )->fetch();

        // if anything was found
        if( isset($id['id']) )
        {
            $this->load($id['id']);
        }
    }

/**
 * Loads account by it's e-mail address.
 * 
 * @version 0.1.5
 * @since 0.1.5
 * @param string $email Account's e-mail address.
 * @throws PDOException On PDO operation error.
 */
    public function findByEMail($email)
    {
        // finds player's ID
        $id = $this->db->query('SELECT ' . $this->db->fieldName('id') . ' FROM ' . $this->db->tableName('accounts') . ' WHERE ' . $this->db->fieldName('email') . ' = ' . $this->db->quote($email) )->fetch();

        // if anything was found
        if( isset($id['id']) )
        {
            $this->load($id['id']);
        }
    }

/**
 * Checks if object is loaded.
 * 
 * @return bool Load state.
 */
    public function isLoaded()
    {
        return isset($this->data['id']);
    }

/**
 * Updates account in database.
 * 
 * <p>
 * Unlike other DAO objects account can't be saved without ID being set. It means that you can't just save unexisting account to automaticly create it. First you have to create record by using {@link OTS_Account::createName() createNamed() method}
 * </p>
 * 
 * <p>
 * Note: Since 0.0.3 version this method throws {@link E_OTS_NotLoaded E_OTS_NotLoaded exception} instead of triggering E_USER_WARNING.
 * </p>
 * 
 * @version 0.1.5
 * @throws E_OTS_NotLoaded If account doesn't have ID assigned.
 * @throws PDOException On PDO operation error.
 */
    public function save()
    {
        if( !isset($this->data['id']) )
        {
            throw new E_OTS_NotLoaded();
        }

        // UPDATE query on database
        $this->db->query('UPDATE ' . $this->db->tableName('accounts') . ' SET ' . $this->db->fieldName('password') . ' = ' . $this->db->quote($this->data['password']) . ', ' . $this->db->fieldName('email') . ' = ' . $this->db->quote($this->data['email']) . ', ' . $this->db->fieldName('rlname') . ' = ' . $this->db->quote($this->data['rlname']) . ', ' . $this->db->fieldName('Vip_Time') . ' = ' . $this->db->quote($this->data['Vip_Time']) . ', ' . $this->db->fieldName('premium_points') . ' = ' . $this->db->quote($this->data['premium_points']) . ', ' . $this->db->fieldName('key') . ' = ' . $this->db->quote($this->data['key']) . ', ' . $this->db->fieldName('location') . ' = ' . $this->db->quote($this->data['location']) . ' WHERE ' . $this->db->fieldName('id') . ' = ' . $this->data['id']);
    }

/**
 * Account number.
 * 
 * <p>
 * Note: Since 0.0.3 version this method throws {@link E_OTS_NotLoaded E_OTS_NotLoaded} exception instead of triggering E_USER_WARNING.
 * </p>
 * 
 * @version 0.0.3
 * @return int Account number.
 * @throws E_OTS_NotLoaded If account is not loaded.
 */
    public function getId()
    {
        if( !isset($this->data['id']) )
        {
            throw new E_OTS_NotLoaded();
        }

        return $this->data['id'];
    }
	
/**
 * Other Account Information.
 * 
 * <p>
 * Note: Since 0.0.3 version this method throws {@link E_OTS_NotLoaded E_OTS_NotLoaded} exception instead of triggering E_USER_WARNING.
 * </p>
 * 
 * @version 0.0.3
 * @return int Account Information.
 * @throws E_OTS_NotLoaded If account is not loaded.
 */
 
	public function getRLName()
    {
        if( !isset($this->data['rlname']) )
        {
            throw new E_OTS_NotLoaded();
        }

        return $this->data['rlname'];
    }
	

       public function getPlayerVip_Time()
    {
        if( !isset($this->data['Vip_Time']) )
        {
            throw new E_OTS_NotLoaded();
        }

        return $this->data['Vip_Time'];
    }  

    public function getLocation()
    {
        if( !isset($this->data['location']) )
        {
            throw new E_OTS_NotLoaded();
        }

        return $this->data['location'];
    }
	
    public function getPageAccess()
    {
        if( !isset($this->data['page_access']) )
        {
            throw new E_OTS_NotLoaded();
        }

        return $this->data['page_access'];
    }
	
    public function getPremDays()
    {
        if( !isset($this->data['premdays']) || !isset($this->data['lastday']) )
        {
            throw new E_OTS_NotLoaded();
        }

        return $this->data['premdays'] - (date("z", time()) + (365 * (date("Y", time()) - date("Y", $this->data['lastday']))) - date("z", $this->data['lastday']));
    }
	
    public function getLastLogin()
    {
        if( !isset($this->data['lastday']) )
        {
            throw new E_OTS_NotLoaded();
        }

        return $this->data['lastday'];
    }
	
    public function isPremium()
    {
        return ($this->data['premdays'] - (date("z", time()) + (365 * (date("Y", time()) - date("Y", $this->data['lastday']))) - date("z", $this->data['lastday'])) > 0);
    }

    public function getCreated()
    {
        if( !isset($this->data['created']) )
        {
            throw new E_OTS_NotLoaded();
        }

        return $this->data['created'];
    }

	public function getRecoveryKey()
    {
        if( !isset($this->data['key']) )
        {
            throw new E_OTS_NotLoaded();
        }

        return $this->data['key'];
    }
	public function getPremiumPoints()
    {
        if( !isset($this->data['premium_points']) )
        {
            throw new E_OTS_NotLoaded();
        }

        return $this->data['premium_points'];
    }

    public function setRLName($rlname)
    {
        $this->data['rlname'] = (string) $rlname;
    }
	
    public function setLocation($loc)
    {
        $this->data['location'] = (string) $loc;
    }
	
    public function setRecoveryKey($rec_key)
    {
        $this->data['key'] = (string) $rec_key;
    }
	
    public function setPremiumPoints($premium_points)
    {
        $this->data['premium_points'] = (string) $premium_points;
    }

/**
 * @version 0.1.0
 * @since 0.0.4
 * @return OTS_Group Group of which current account is member (currently random group).
 * @throws E_OTS_NotLoaded If account is not loaded.
 * @deprecated 0.0.6 There is no more group_id field in database.
 */
    public function getGroup()
    {
        if( !isset($this->data['id']) )
        {
            throw new E_OTS_NotLoaded();
        }

        // loads default group
        $groups = new OTS_Groups_List();
        $groups->rewind();
        return $groups->current();
    }

/**
 * Name.
 * 
 * @version 0.1.5
 * @since 0.1.5
 * @return string Name.
 * @throws E_OTS_NotLoaded If account is not loaded.
 */
    public function getName()
    {
        if( !isset($this->data['name']) )
        {
            throw new E_OTS_NotLoaded();
        }

        return $this->data['name'];
    }

/**
 * Sets account's name.
 * 
 * <p>
 * This method only updates object state. To save changes in database you need to use {@link OTS_Account::save() save() method} to flush changed to database.
 * </p>
 * 
 * @version 0.1.5
 * @since 0.1.5
 * @param string $name Account name.
 */
    public function setName($name)
    {
        $this->data['name'] = (string) $name;
    }

/**
 * Account's password.
 * 
 * <p>
 * Doesn't matter what password hashing mechanism is used by OTServ - this method will just return RAW database content. It is not possible to "decrypt" hashed strings, so it even wouldn't be possible to return real password string.
 * </p>
 * 
 * <p>
 * Note: Since 0.0.3 version this method throws {@link E_OTS_NotLoaded E_OTS_NotLoaded} exception instead of triggering E_USER_WARNING.
 * </p>
 * 
 * @version 0.0.3
 * @return string Password.
 * @throws E_OTS_NotLoaded If account is not loaded.
 */
    public function getPassword()
    {
        if( !isset($this->data['password']) )
        {
            throw new E_OTS_NotLoaded();
        }

        return $this->data['password'];
    }

/**
 * Sets account's password.
 * 
 * <p>
 * This method only updates object state. To save changes in database you need to use {@link OTS_Account::save() save() method} to flush changed to database.
 * </p>
 * 
 * <p>
 * Remember that this method just sets database field's content. It doesn't apply any hashing/encryption so if OTServ uses hashing for passwords you have to apply it by yourself before passing string to this method.
 * </p>
 * 
 * @param string $password Password.
 */
    public function setPassword($password)
    {
        $this->data['password'] = (string) $password;
    }

/**
 * E-mail address.
 * 
 * <p>
 * Note: Since 0.0.3 version this method throws {@link E_OTS_NotLoaded E_OTS_NotLoaded} exception instead of triggering E_USER_WARNING.
 * </p>
 * 
 * @version 0.0.3
 * @return string E-mail.
 * @throws E_OTS_NotLoaded If account is not loaded.
 */
    public function getEMail()
    {
        if( !isset($this->data['email']) )
        {
            throw new E_OTS_NotLoaded();
        }

        return $this->data['email'];
    }

/**
 * Sets account's email.
 * 
 * <p>
 * This method only updates object state. To save changes in database you need to use {@link OTS_Account::save() save() method} to flush changed to database.
 * </p>
 * 
 * @param string $email E-mail address.
 */
    public function setEMail($email)
    {
        $this->data['email'] = (string) $email;
    }


/**
 * Checks if account is blocked.
 * 
 * <p>
 * Note: Since 0.0.3 version this method throws {@link E_OTS_NotLoaded E_OTS_NotLoaded} exception instead of triggering E_USER_WARNING.
 * </p>
 * 
 * @version 0.0.3
 * @return bool Blocked state.
 * @throws E_OTS_NotLoaded If account is not loaded.
 */
    public function isBlocked()
    {
        if( !isset($this->data['blocked']) )
        {
            throw new E_OTS_NotLoaded();
        }

        return $this->data['blocked'];
    }

/**
 * Unblocks account.
 * 
 * <p>
 * This method only updates object state. To save changes in database you need to use {@link OTS_Account::save() save() method} to flush changed to database.
 * </p>
 */
    public function unblock()
    {
        $this->data['blocked'] = false;
    }

/**
 * Blocks account.
 * 
 * <p>
 * This method only updates object state. To save changes in database you need to use {@link OTS_Account::save() save() method} to flush changed to database.
 * </p>
 */
    public function block()
    {
        $this->data['blocked'] = true;
    }

/**
 * Checks if account is deleted (by flag setting).
 * 
 * @version 0.1.5
 * @since 0.1.5
 * @return bool Flag state.
 * @throws E_OTS_NotLoaded If account is not loaded.
 */
    public function isDeleted()
    {
        if( !isset($this->data['deleted']) )
        {
            throw new E_OTS_NotLoaded();
        }

        return $this->data['blocked'];
    }

/**
 * Unsets account's deleted flag.
 * 
 * <p>
 * This method only updates object state. To save changes in database you need to use {@link OTS_Account::save() save() method} to flush changed to database.
 * </p>
 * 
 * @version 0.1.5
 * @since 0.1.5
 */
    public function unsetDeleted()
    {
        $this->data['deleted'] = false;
    }

/**
 * Deletes account (only by setting flag state, not physicly).
 * 
 * <p>
 * This method only updates object state. To save changes in database you need to use {@link OTS_Account::save() save() method} to flush changed to database.
 * </p>
 * 
 * @version 0.1.5
 * @since 0.1.5
 */
    public function setDeleted()
    {
        $this->data['deleted'] = true;
    }

/**
 * Checks if account is warned.
 * 
 * @version 0.1.5
 * @since 0.1.5
 * @return bool Flag state.
 * @throws E_OTS_NotLoaded If account is not loaded.
 */
    public function isWarned()
    {
        if( !isset($this->data['warned']) )
        {
            throw new E_OTS_NotLoaded();
        }

        return $this->data['warned'];
    }

/**
 * Unwarns account.
 * 
 * <p>
 * This method only updates object state. To save changes in database you need to use {@link OTS_Account::save() save() method} to flush changed to database.
 * </p>
 * 
 * @version 0.1.5
 * @since 0.1.5
 */
    public function unwarn()
    {
        $this->data['warned'] = false;
    }

/**
 * Warns account.
 * 
 * <p>
 * This method only updates object state. To save changes in database you need to use {@link OTS_Account::save() save() method} to flush changed to database.
 * </p>
 * 
 * @version 0.1.5
 * @since 0.1.5
 */
    public function warn()
    {
        $this->data['warned'] = true;
    }

/**
 * @version 0.0.4
 * @return int PACC days.
 * @throws E_OTS_NotLoaded If account is not loaded.
 * @deprecated 0.0.3 There is no more premdays field in accounts table.
 */
    public function getPACCDays()
    {
        if( !isset($this->data['id']) )
        {
            throw new E_OTS_NotLoaded();
        }

        return 0;
    }

/**
 * @version 0.0.4
 * @param int $pacc PACC days.
 * @deprecated 0.0.3 There is no more premdays field in accounts table.
 */
    public function setPACCDays($premdays)
    {
    }

/**
 * Reads custom field.
 * 
 * <p>
 * Reads field by it's name. Can read any field of given record that exists in database.
 * </p>
 * 
 * <p>
 * Note: You should use this method only for fields that are not provided in standard setters/getters (SVN fields). This method runs SQL query each time you call it so it highly overloads used resources.
 * </p>
 * 
 * @version 0.0.5
 * @since 0.0.3
 * @param string $field Field name.
 * @return string Field value.
 * @throws E_OTS_NotLoaded If account is not loaded.
 * @throws PDOException On PDO operation error.
 */
    public function getCustomField($field)
    {
        if( !isset($this->data['id']) )
        {
            throw new E_OTS_NotLoaded();
        }

        $value = $this->db->query('SELECT ' . $this->db->fieldName($field) . ' FROM ' . $this->db->tableName('accounts') . ' WHERE ' . $this->db->fieldName('id') . ' = ' . $this->data['id'])->fetch();
        return $value[$field];
    }

/**
 * Writes custom field.
 * 
 * <p>
 * Write field by it's name. Can write any field of given record that exists in database.
 * </p>
 * 
 * <p>
 * Note: You should use this method only for fields that are not provided in standard setters/getters (SVN fields). This method runs SQL query each time you call it so it highly overloads used resources.
 * </p>
 * 
 * <p>
 * Note: Make sure that you pass $value argument of correct type. This method determinates whether to quote field name. It is safe - it makes you sure that no unproper queries that could lead to SQL injection will be executed, but it can make your code working wrong way. For example: $object->setCustomField('foo', '1'); will quote 1 as as string ('1') instead of passing it as a integer.
 * </p>
 * 
 * @version 0.0.5
 * @since 0.0.3
 * @param string $field Field name.
 * @param mixed $value Field value.
 * @throws E_OTS_NotLoaded If account is not loaded.
 * @throws PDOException On PDO operation error.
 */
    public function setCustomField($field, $value)
    {
        if( !isset($this->data['id']) )
        {
            throw new E_OTS_NotLoaded();
        }

        // quotes value for SQL query
        if(!( is_int($value) || is_float($value) ))
        {
            $value = $this->db->quote($value);
        }

        $this->db->query('UPDATE ' . $this->db->tableName('accounts') . ' SET ' . $this->db->fieldName($field) . ' = ' . $value . ' WHERE ' . $this->db->fieldName('id') . ' = ' . $this->data['id']);
    }

/**
 * @version 0.1.0
 * @return array Array of OTS_Player objects from given account.
 * @throws E_OTS_NotLoaded If account is not loaded.
 * @deprecated 0.0.5 Use getPlayersList().
 */
    public function getPlayers()
    {
        if( !isset($this->data['id']) )
        {
            throw new E_OTS_NotLoaded();
        }

        $players = array();

        foreach( $this->db->query('SELECT ' . $this->db->fieldName('id') . ' FROM ' . $this->db->tableName('players') . ' WHERE ' . $this->db->fieldName('account_id') . ' = ' . $this->data['id'])->fetchAll() as $player)
        {
            // creates new object
            $object = new OTS_Player();
            $object->load($player['id']);
            $players[] = $object;
        }

        return $players;
    }

/**
 * List of characters on account.
 * 
 * <p>
 * In difference to {@link OTS_Account::getPlayers() getPlayers() method} this method returns filtered {@link OTS_Players_List OTS_Players_List} object instead of array of {@link OTS_Player OTS_Player} objects. It is more effective since OTS_Player_List doesn't perform all rows loading at once.
 * </p>
 * 
 * <p>
 * Note: Returned object is only prepared, but not initialised. When using as parameter in foreach loop it doesn't matter since it will return it's iterator, but if you will wan't to execute direct operation on that object you will need to call {@link OTS_Base_List::rewind() rewind() method} first.
 * </p>
 * 
 * @version 0.1.4
 * @since 0.0.5
 * @return OTS_Players_List List of players from current account.
 * @throws E_OTS_NotLoaded If account is not loaded.
 */
    public function getPlayersList()
    {
        if( !isset($this->data['id']) )
        {
            throw new E_OTS_NotLoaded();
        }

        // creates filter
        $filter = new OTS_SQLFilter();
        $filter->compareField('account_id', (int) $this->data['id']);

        // creates list object
        $list = new OTS_Players_List();
        $list->setFilter($filter);

        return $list;
    }

/**
 * @version 0.1.5
 * @since 0.0.5
 * @param int $time Time for time until expires (0 - forever).
 * @throws PDOException On PDO operation error.
 * @deprecated 0.1.5 Use OTS_AccountBan class.
 */
    public function ban($time = 0)
    {
        // can't ban nothing
        if( !$this->isLoaded() )
        {
            throw new E_OTS_NotLoaded();
        }

        // creates ban entry
        $ban = new OTS_AccountBan();
        $ban->setValue($this->data['id']);
        $ban->setExpires($time);
        $ban->setAdded( time() );
        $ban->activate();
        $ban->save();
    }

/**
 * @version 0.1.5
 * @since 0.0.5
 * @throws PDOException On PDO operation error.
 * @deprecated 0.1.5 Use OTS_AccountBan class.
 */
    public function unban()
    {
        // can't unban nothing
        if( !$this->isLoaded() )
        {
            throw new E_OTS_NotLoaded();
        }

        // deletes ban entry
        $ban = new OTS_AccountBan();
        $ban->find($this->data['id']);
        $ban->delete();
    }

/**
 * @version 0.1.5
 * @since 0.0.5
 * @return bool True if account is banned, false otherwise.
 * @throws PDOException On PDO operation error.
 * @deprecated 0.1.5 Use OTS_AccountBan class.
 */
    public function isBanned()
    {
        // nothing can't be banned
        if( !$this->isLoaded() )
        {
            throw new E_OTS_NotLoaded();
        }

        // finds ban entry
        $ban = new OTS_AccountBan();
        $ban->find($this->data['id']);
        return $ban->isLoaded() && $ban->isActive() && ( $ban->getExpires() == 0 || $ban->getExpires() > time() );
    }

/**
 * Deletes account.
 * 
 * <p>
 * This method physicly deletes account from database! To set <i>deleted</i> flag use {@link OTS_Account::setDeleted() setDeleted() method}.
 * </p>
 * 
 * @version 0.0.5
 * @since 0.0.5
 * @throws E_OTS_NotLoaded If account is not loaded.
 * @throws PDOException On PDO operation error.
 */
    public function delete()
    {
        if( !isset($this->data['id']) )
        {
            throw new E_OTS_NotLoaded();
        }

        // deletes row from database
        $this->db->query('DELETE FROM ' . $this->db->tableName('accounts') . ' WHERE ' . $this->db->fieldName('id') . ' = ' . $this->data['id']);

        // resets object handle
        unset($this->data['id']);
    }

/**
 * Checks highest access level of account.
 * 
 * @return int Access level (highest access level of all characters).
 * @throws PDOException On PDO operation error.
 */
    public function getAccess()
    {
        // by default
        $access = 0;

        // finds groups of all characters
        foreach( $this->getPlayersList() as $player)
        {
            $group = $player->getGroup();

            // checks if group's access level is higher then previouls found highest
            if( $group->getAccess() > $access)
            {
                $access = $group->getAccess();
            }
        }

        return $access;
    }

/**
 * Checks highest access level of account in given guild.
 * 
 * @param OTS_Guild $guild Guild in which access should be checked.
 * @return int Access level (highest access level of all characters).
 * @throws PDOException On PDO operation error.
 */
    public function getGuildAccess(OTS_Guild $guild)
    {
        // by default
        $access = 0;

        // finds ranks of all characters
        foreach( $this->getPlayersList() as $player)
        {
            $rank = $player->getRank();

            // checks if rank's access level is higher then previouls found highest
            if( isset($rank) && $rank->getGuild()->getId() == $guild->getId() && $rank->getLevel() > $access)
            {
                $access = $rank->getLevel();
            }
        }

        return $access;
    }

/**
 * Returns players iterator.
 * 
 * <p>
 * There is no need to implement entire Iterator interface since we have {@link OTS_Players_List players list class} for it.
 * </p>
 * 
 * @version 0.0.5
 * @since 0.0.5
 * @throws E_OTS_NotLoaded If account is not loaded.
 * @throws PDOException On PDO operation error.
 * @return Iterator List of players.
 */
    public function getIterator()
    {
        return $this->getPlayersList();
    }

/**
 * Returns number of player within.
 * 
 * @version 0.0.5
 * @since 0.0.5
 * @throws E_OTS_NotLoaded If account is not loaded.
 * @throws PDOException On PDO operation error.
 * @return int Count of players.
 */
    public function count()
    {
        return $this->getPlayersList()->count();
    }

/**
 * Magic PHP5 method.
 * 
 * @version 0.1.5
 * @since 0.1.0
 * @param string $name Property name.
 * @return mixed Property value.
 * @throws E_OTS_NotLoaded If account is not loaded.
 * @throws OutOfBoundsException For non-supported properties.
 * @throws PDOException On PDO operation error.
 */
    public function __get($name)
    {
        switch($name)
        {
            case 'id':
                return $this->getId();

            case 'name':
                return $this->getName();

            case 'password':
                return $this->getPassword();

            case 'eMail':
                return $this->getEMail();

            case 'premiumEnd':
                return $this->getPremiumEnd();

            case 'loaded':
                return $this->isLoaded();

            case 'playersList':
                return $this->getPlayersList();

            case 'blocked':
                return $this->isBlocked();

            case 'deleted':
                return $this->isDeleted();

            case 'warned':
                return $this->isWarned();

            case 'banned':
                return $this->isBanned();

            case 'access':
                return $this->getAccess();

            default:
                throw new OutOfBoundsException();
        }
    }

/**
 * Magic PHP5 method.
 * 
 * @version 0.1.5
 * @since 0.1.0
 * @param string $name Property name.
 * @param mixed $value Property value.
 * @throws E_OTS_NotLoaded If account is not loaded.
 * @throws OutOfBoundsException For non-supported properties.
 * @throws PDOException On PDO operation error.
 */
    public function __set($name, $value)
    {
        switch($name)
        {
            case 'name':
                $this->setName($name);
                break;

            case 'password':
                $this->setPassword($value);
                break;

            case 'eMail':
                $this->setEMail($value);
                break;

            case 'premiumEnd':
                $this->setPremiumEnd($value);
                break;

            case 'blocked':
                if($value)
                {
                    $this->block();
                }
                else
                {
                    $this->unblock();
                }
                break;

            case 'deleted':
                if($value)
                {
                    $this->setDeleted();
                }
                else
                {
                    $this->unsetDeleted();
                }
                break;

            case 'warned':
                if($value)
                {
                    $this->warn();
                }
                else
                {
                    $this->unwarn();
                }
                break;

            case 'banned':
                if($value)
                {
                    $this->ban();
                }
                else
                {
                    $this->unban();
                }
                break;

            default:
                throw new OutOfBoundsException();
        }
    }

/**
 * Returns string representation of object.
 * 
 * <p>
 * If any display driver is currently loaded then it uses it's method. Otherwise just returns account number.
 * </p>
 * 
 * @version 0.1.3
 * @since 0.1.0
 * @return string String representation of object.
 */
    public function __toString()
    {
        $ots = POT::getInstance();

        // checks if display driver is loaded
        if( $ots->isDisplayDriverLoaded() )
        {
            return $ots->getDisplayDriver()->displayAccount($this);
        }

        return $this->getId();
    }
}

/**#@-*/

?>