LuaT �

xV           (w@�@MoistScript_Blacklist_Module.lua�� �Q      B�  8 �    ��  ���� D     �   ���� D F   B   8 �    �   ���� D     �   ���� D F �	O    
     �  
D F ��MoistScript_NextGen�menu�notify�MoistScript NG Required��  �    �EXECUTION DENIED ! ! !�MoistScript_NG_BlackListModule�MoistScript NG Blacklist Module Already Loaded ! ! !�loaded�MoistsBlacklistMain�menu�create_thread�  ����  �   �   � � �      �   � � �      R   �   R     R   �  R      R   �  R   ���	
   
  R   ���  R   ���  R   �  �  R   �   � ����	��	 �ʈ �
  R    �
 ���
 ��� ���	��	 �ʈ ������ � � � �� �	 
 
� � �	 �	 
 
� � �	 �	 
 
� � �	 �	 
 
� � �	 �� 
 
ϊ  � � 	 #	$�"� �	 �� 
 
�
 � %� %	 (	)�'ψ  *�  +ψ  ,�  -ψ  .�  /ψ  0�  1ψ  2�  3ψ  4�  5ψ  6� 7�8� �	 
 
;�
 �� 7�8� �� 
 
;ϊ � <� <	 ?	@�>� 7�8	! �� 
 
;�
	 � A� A	 D	E�C� 7�8�# �� 
 
;ϊ	 � F� F	 I	J�H� 7�8�% �� 
 
;�

 �  � M�NL� 7�8	( �	 
 
;ϊ
 � O� 7�8�( �	 
 
;�� � 7�S	* �	 
 U
;�
 � R���	 R	V4	 �	 �� �
 R�
V�
��WXɈ � 7�S	- �	 
 U
;ϊ � Y�  [� 7�S�. �	 
 U
;ϊ � \� 7�S�/ �	 
 U
;�
 � ^ψ  `�  aψ  b�  cψ  d�  eψ  f�  gψ  h� i�j�5 �	6 
 
m�
 �� i�j	7 �� 
 
mϊ �  � p�qo� i�j	9 �� 
 
m�
 �� � t�u�s� i�j	; �� 
 
mϊ �� � x�y�w� i�j	= �	6 
 
m�
 �� i�j�/ �	 
 {
m�  ψ  |� ~�	@ �	 � }� ��� ��ƈ ��FolderPaths�scidFile�Blacklist�\scid.ini�IPFile�\IPs.ini�Namez�scids�scidN�PlayerCount        �require�MoistScript_MoistBasics_Module�Fetch_SCID_Friends�Name�nil�BLM�Blacklist_Mainparent�LocalFeatures�Blacklist_parent�menu�add_feature�Blacklist Features�parent�id�SCID Blacklist�BlackIPlist�IP Blacklist�BlacklistOpt�Blacklist Options�Kick_method�Use Host Kick?�toggle�on�ScriptConfig�Kick_Method�Dont_Kick_Friends�Dont Kick My Friends?�on�ScriptConfig�NotKick_Friends�CurDate_Time�DebugOut�ip2dec�dec2ip�Get_Partial_IP�ValidIP�Blacklist_Remove_IP�GetPID�Blacklist_Remove_IPByPid�Blacklist_Remove_IP_BlacklistBYFeature�Blacklist_Add_IP�Blacklist_Add_IP_By_Pid�IP_Blacklist_Load�menu�add_feature�Reload IP's�action�id�EnableIPBlacklistFeature�Enable IP Blacklist�on�ScriptConfig�Blacklist_IP_ON�PartIPModder_Match�Partial Match IP's�on�ScriptConfig�Blacklist_IP_Part�MarkAsIPModderFeature�Mark IP As Modder�on�ScriptConfig�Blacklist_IP_Mark�Kick IP�on�ScriptConfig�Blacklist_IP_kick�Blacklist_IP_Manual_Add�Manually add IP�Remove IP from blacklist�Blacklist_Add_IPBlacklist�add_player_feature�Blacklist Players IP�FeaturesonlineParent�feats�hidden�RemoveFromIPBlacklist�Remove from IP Blacklist�Blacklist_Check_PlayerIP�add2blacklist�Add Player to blacklist�removefromblacklist�Remove from Blacklist�ValidScid�Blacklist_Remove_Scid�Blacklist_Remove_ScidByPid�Blacklist_Remove_ScidByFeature�Blacklist_Add_Scid�Blacklist_Add_Scid_By_Pid�Blacklist_Load�Blacklist_Kick_Pid�MarkPidAsModder�menu�add_feature�Reload blacklist�action�id�Enable blacklist�on�ScriptConfig�Blacklist_ON�Mark As Modder�on�ScriptConfig�Blacklist_Mark�Kick Player�on�ScriptConfig�Blacklist_kick�Manually add scid�Blacklist�Blacklist_Check_Player�BlackList_Join_Event_Check�event�add_event_listener�player_join�IP_Blacklist_Load�Blacklist_Load�   ����  ����   � � � ~� � �J    � D�  �  �	 I� G  ��network�get_friend_count�get_friend_index_name�get_friend_scid�    ��              ����(for state)���(for state)���(for state)���FriD���FrName���FrSCID����_ENV�SCIDFriends��� ��      � �  8  ��  �    8 ��  ���  �  ���  �  ��type�number�on�ScriptConfig�Kick_Method�   ��        ���feat����_ENV��� ��      � �  8  ��  �    8 ��  ���  �  ���  �  ��type�number�on�ScriptConfig�NotKick_Friends�   ��        ���feat����_ENV���  
�  �  ��   � �   � ��  �  �� �  � �� �  ��   � 5 �� � ��os�date�string�match�%d%d:%d%d:%d%d�%d/%m/%y%y�format�[�]�   ��                      ���d���dtime���dt����_ENV��� 	��   �  � �� �  D� �  �� �� �  �  � 5 �� ��� ��CurDate_Time�io�open�Path�Root�\Blacklist\MoistsBlacklist_debug.log�a�output�write�[�] �
�close�   ��                     ���text���txt���file����_ENV��� 
��      � � D0����".�0�".".� � � � �  � ��tostring�match�(%d%d?%d?)%.(%d%d?%d?)%.(%d%d?%d?)%.(%d%d?%d?)      pA      �@      p@�string�format�%d�   ��                    ���ipv4���str���o1���o2���o3���o4���num����_ENV��� ��  �����J  � �� �� 	�
 � . D� �	   � �  	   � �  �� 8 �  ��   5 � I� � G �       �math�floor�fmod �.�   ��                        ����decip���div���quote���ip���(for state)���(for state)���(for state)���i����_ENV��� 
ŀ     ���  ��  ��  8 �� ��~��D�   � �   ��������  � � �  DB  8 ���� �~/��  �  5   ��/�D�  ���  ��  ��  � �� ��~��D�   �   ��������  H G ���find�.�sub���                                                ���ip�Ņtext�ņcheck�ńsep�ŅPart���value���sep�ŅPart���value���sep�ŅPart�Ævalue�À��� �=�~ �  �= ~ 8  ��   �   �  �  ����      ���IP������ ڋ      � 	   	  B  � �	 �  � �� D� �  �� 		 �� B  � �� �	
  ��   � 5 �� � �  � ��� ���� ��9  8 � �D8  �Ɂ � �~��� �  ��    �  �� � D � �� 8 � � �D � � �   � 5 � D F� ��GetPID�name �io�open�FolderPaths�IPFile�w+�output�pairs�write�|�
�close�child_count�children�data�menu�delete_feature�id�DebugOut�string�format�Removed � : � from Blacklist�player�unset_player_as_modder�Player in Session Removed Modder Marking �   
 	  ��                           �            �                           ���IP�ډplayerID�څfile�Ȍ(for state)���(for state)���(for state)���(for state)���k���v���(for state)���(for state)���(for state)���i���f����_ENV�IPs�Blacklist_Remove_IP_Blacklist_Feature�IPN��� ������ �ʀ �   � D � 9  8  �H �  �  ��dec2ip�player�get_player_ip�   ��         ����IP���(for state)���(for state)���(for state)���pid���PIP����_ENV��� ��   � � 9  8  ��  �    �  D �   �   � �   8 ��   � �  ��player�player_id�IP�dec2ip�get_player_ip�ValidIP�Blacklist_Remove_IP�   ��                ���pid����_ENV��� ��      � �� 8  ��  �  �  � � �  ��type�userdata�menu�create_thread�Blacklist_Remove_IP�data�   ��        ���feat����_ENV��� �	   B  8  �G   8  ��   	   ��� D��  ���   �   �� 5 ���
�� ����� ��	 ��    �   �� 5 � ��� ���    �   ��  � D � ��� ��Unknown�io�open�FolderPaths�IPFile�a�output�write�|�
�close�menu�add_feature�: � (�)�action�id�Blacklist_Remove_IP_BlacklistBYFeature�data�DebugOut�string�format�Added �to blacklist�IP_Blacklist_Load�
     	 ��                                                   ���IP���name���file����IPs�_ENV�IPN�Blacklist_Remove_IP_Blacklist_Feature��� ��   � � 9  8  ��  �    �  D �   � DB  8 � �   �  D D G ��player�player_id�dec2ip�get_player_ip�ValidIP�Blacklist_Add_IP�get_player_name�   ��                   ���pid���IP����_ENV���  �   R   
      R   
  ��
  ��
    �  ��J  ���DI�    � � D B�  8  �F�  	  
� � D K� ��� ����  ��  ��  8 �� ��~��D�������  8  �� B  8 �B  8 �� D� �
		 
�/�
 	  	
� �	 � 
 �	 �
 �  �D	 
�/�
 L  M� 6    �  	 �� �  D  �  	 �� �  D F� ��child_count�menu�delete_feature�children�id�utils�file_exists�FolderPaths�IPFile�io�lines�match�(%x+)|?(.-)$�find�|�sub�Unknown�Get_Partial_IP�add_feature�: � (�)�action�Blacklist_Remove_IP_BlacklistBYFeature�data�DebugOut�Loaded IP Blacklist with � IP entries�MoistNotify�
    	    ��              �                                                     �           ���(for state)���(for state)���(for state)���i���(for state)�݌(for state)�݌(for state)�݌(for state)�݅line�ڃIP�څname�ڄsep�ڃIP�څname�چ�IPs�pIPs�pIPsN�IPN�Blacklist_Remove_IP_Blacklist_Feature�_ENV���  �   D   �   �  � � D G  ��IP_Blacklist_Load�MoistNotify� IP entries �Blacklisted IP's Loaded ����    �    ��       ����_ENV�IPN��� ��      � �  8  ��  �    8 ��  ���  �  ������� �ʀ � �  ��  8 �� 	  ��  �  ��type�number�on�ScriptConfig�Blacklist_IP_ON�player�is_player_valid�Blacklist_Check_PlayerIP�   ��                  ����feat���(for state)���(for state)���(for state)���pid����_ENV��� ��      � �  8  ��  �    8 ��  ���  �  ���  �  ��type�number�on�ScriptConfig�Blacklist_IP_Part�   ��        ���feat����_ENV��� ��      � �  8  ��  �    8 ��  ���  �  ���  �  ��type�number�on�ScriptConfig�Blacklist_IP_Mark�   ��        ���feat����_ENV��� ��      � �  8  ��  �    8 ��  ���  �  ���  �  ��type�number�on�ScriptConfig�Blacklist_IP_kick�   ��        ���feat����_ENV��� ��      � �  8  ��  �  �  �� ������ � � 8 �� � 8 �� � 8  �� �   � �� 	 � � � 5 ��  �� ��type�number�input�get�Enter IP: (0.0.0.0) ��HANDLER_CONTINUE�Blacklist_Add_IP�Manual Add�MoistNotify�Added IP: �
�To IP Blacklist �IP Blacklist�  �    �   ��                         ���feat���r���s����_ENV��� �  �  D< 8  �G  � D B  � � B  � � � � DB  8 � � DG ��type�number�Blacklist_Add_IP_By_Pid�EnableIPBlacklistFeature�on�MarkAsIPModderFeature�MarkPidAsModder�IP�Blacklist_Kick_Pid�    ��                   ���feat���pid����_ENV�Blacklist_Kick_IP_Feature��� �  �  D< 8  �G  � D � �DG G ��type�number�Blacklist_Remove_IPByPid�player�unset_player_as_modder�   ��          ���feat���pid����_ENV��� ��    � �   � D Á 8  ���  B  8 � �  D� B�  8  �G  �  D�   �  � 	  ��  � �
�  � �� �  � �� ��  �- � �/ �� �  �
 ��  � � Ä 8  ��  ��   5 B�  �  �	 � � � �/ �� ��� ��  � ��    ��
 �� ��  � ��    �� �� �
  � ��   ��  8 �� ��  8 �� �   ��  �  �� � �   �� 	 
�   � � �� D B  � � �  �
 D B  8 � �  D� ��tostring�player�get_player_name�NaN�ScriptConfig�NotKick_Friends�get_player_scid�get_player_ip�dec2ip�Get_Partial_IP�Blacklist_IP_Part�MoistNotify�(� : �) �
�Blacklist Partial IP Join:�  �    �Blacklist_IP_Mark�MarkPidAsModder�IP�Blacklist_IP_kick�Blacklist_Kick_Pid�ValidIP�MoistScript NG Blacklisted IP�    
   ��                                                                                                    �             ��ꆄpid���PartialIP���TransIP���name���IP���name����_ENV�SCIDFriends�IPs�pIPs�BLIPNotify��� �  �  D< 8  �G  D�  � � � D� B�  8 � � D B  8 � � DG G ��type�number�player�player_id�get_player_scid�Blacklist_Add_Scid_By_Pid�ScriptConfig�Blacklist_kick�Blacklist_Kick_Pid�    ��                       ���feat���pid����_ENV�SCIDFriends��� �  �  D< 8  �G  � D � �DG G ��type�number�Blacklist_Remove_ScidByPid�player�unset_player_as_modder�   ��          ���feat���pid����_ENV��� �= ~ 8  ��   �   �  �  ����    ���scid������ Ƌ  �    �  �  �   � ��  �� �  �  �� �  � D 	� DK �  � � 
� � �  � DL M 6   D� ��J ��  8 �� ��8  �I�  ~/�  � � �  � �   5 � D ƀ ��name�scids �io�open�FolderPaths�scidFile�w+�output�pairs�write�|�
�close�child_count�children�data�menu�delete_feature�id�scidN�DebugOut�string�format�Removed � : � from Blacklist�    ��                         �            �             ���scid�ƅfile�Ō(for state)���(for state)���(for state)���(for state)���k���v���(for state)���(for state)���(for state)���i���f����_ENV�Blacklist_Remove_Feature��� ��   � � 9  8  ��  �   �    �  � DB  8 � � DG ��player�player_id�get_player_scid�ValidScid�Blacklist_Remove_Scid�   ��             ���pid���scid����_ENV��� ��      � �� 8  ��  �  �  � � �  ��type�userdata�menu�create_thread�Blacklist_Remove_Scid�data�   ��        ���feat����_ENV��� �   B  8  �G   8  ���      � � D� �  �� �   ��   � 5 �� ��� ���� � � ��    �   �� 5 �	 � �� �  ��    �   � � � D � � �� ��scids�Unknown�io�open�FolderPaths�scidFile�a�output�write�|�
�close�scidN�menu�add_feature�: � (�) �action�id�Blacklist_Remove_ScidByFeature�data�DebugOut�string�format�Added �)�to Blacklist�Blacklist_Load�    ��                                                   ���scid���name���file����_ENV�Blacklist_Remove_Feature��� ��   � � 9  � ��   �    � 	 �   � ��   �    �  � DB  8 � �   �  D D �  ��player�player_id�get_player_scid�ValidScid�Blacklist_Add_Scid�get_player_name�    ��                         ���pid���scid����_ENV�SCIDFriends���  �   R      � �  ��J   ���DI�     	�  
� D B�  8  �F�     �  
� D K� ���� �B�  8  � �  8 ��   �  � ��   �����  �	 �   � �	 � 
 � �
 �  � D �/� L  M� 6   F� ��scids�scidN        �child_count�menu�delete_feature�children�id�utils�file_exists�FolderPaths�scidFile�io�lines�match�(%x+)|?(.-)$�Unknown�tonumber�add_feature� : � (�) �action�Blacklist_Remove_ScidByFeature�data�    ��          �                                          � ���(for state)���(for state)���(for state)���i���(for state)�ǌ(for state)�ǌ(for state)�ǌ(for state)�ǅline�ąscid�ąname�ąscid�Ă�_ENV�Blacklist_Remove_Feature��� 
֋  �    � 	  � �   8 �� � �   8  ��  �  �    �  �  DB�  8  �� ���  � �����  �Y ���	   � �/ �� �  �T ��
��    � C� �  �� � D � �	 Â �  ���5 ��	 
 � �/ �� ��8F ���  8D ���! �/���    �� 0 �/��0�0� � ��! �/���  D�� 0 �/��0�0� � � �   ��  8. ���   � �/ �� �  � ��  �  D �   �
��    � C� �  �� � D � �� Â �  ���5 ��	 
 � �/ �� ��8 �� �   �  8 � �/ �� �  8 ��  �  D �   �
�    � C� �  �� � D � �� Â �  ���5 ��	 
 � �/ �� ��� ��player�get_player_scid�ScriptConfig�NotKick_Friends�get_player_name�NaN�Kick_Method�network�network_is_host�network_session_kick_player�DebugOut�string�format�MoistScript NG Blacklist: Host kicked � (�scids�) �MoistNotify�Host Kicked: �MoistScript NG Blacklist�  �    �script�trigger_script_event_2�ڐ6    �get_global_i`      ��     �      �player_id�is_player_valid�force_remove_player�tostring�MoistScript NG Blacklist: Force Removed Player �)�Desync Kicked: �MoistScript NG Blacklist: Non-Host kicked �Non Host Kicked: �     ��                                                                                                       �                                                                                �����pid�օscid�օname�փ�SCIDFriends�_ENV�BL_Notify��� 
�  D9  8  �G �  � �  �   D  �  D�  �   �  �  �� �  �/ �� �  80 �� 	 
�    ��  B�  �  �	 � � � D � �    ��  B�  �  �	 � 5 �� � �/ �� ��� ��  � �  �   D  �  D�  �   �  8 ��  �/ �� �   �/ �� �  � �� 	 
�    ��  B�  �  � � � � D � �    ��  B�  �  � � 5 �� � �/ �� ��G ��player�player_id�IP�set_player_as_modder�M_ModFlag�BLACKLIST_IP�get_player_ip�name�get_player_name�DebugOut�string�format�Black List:
� : (�) �Black List: Marked As Modder�MoistNotify�scid�BLACKLIST_SCID�get_player_scid�Namez�scids�   
  ��                                                                                                       �       �����pid���BlkLst���IP���scid����_ENV�IPs�BL_M_Notify���  �   D   �   � �  � � D G  ��Blacklist_Load�MoistNotify�Reloaded Blacklist�scidN� entries�Moist Blacklist����    �   ��        ����_ENV��� ��      � �  8  ��  �    8 ��  ���  �  ������� ��  � �  ��  � �� �	�9� 8 �� 
  �ɀ �  ��type�number�on�ScriptConfig�Blacklist_ON�player�is_player_valid�player_id�Blacklist_Check_Player�   ��                      ����feat���(for state)���(for state)���(for state)���pid����_ENV��� ��      � �  8  ��  �    8 ��  ���  �  ���  �  ��type�number�on�ScriptConfig�Blacklist_Mark�   ��        ���feat����_ENV��� ��      � �  8  ��  �    8 ��  ���  �  ���  �  ��type�number�on�ScriptConfig�Blacklist_kick�   ��        ���feat����_ENV��� ��      � �  8  ��  �  �  �� ����� � � �  �� � � � 8  �� �  � D�� �� 
� �  5 ��  �� ��type�number�input�get�Enter SCID to add��HANDLER_CONTINUE�Blacklist_Add_Scid�tonumber�Manual add�MoistNotify�Added � to blacklist�Blacklist�  �    �   ��                         ���feat���r���s����_ENV��� ԋ   � �   8 ��  �    � 	 �   8  ��  �  �    �  B  � � �  DB�  8 �B  �  � �  � 	  � � 	 �� � 	  �5 � � �� � �  	� D�  	� �	D�  	� D�� 5 ��  ��  � ��    �
 ��  ��  8 ��    �G ��ScriptConfig�NotKick_Friends�player�get_player_scid�scids�get_player_name�Name�MoistNotify�(�tostring� : �) �BlackList Player Joining: �  �    �DebugOut�SCID Black List Player Joining: �)
SCID: �
�Blacklist_Mark�MarkPidAsModder�scid�Blacklist_kick�Blacklist_Kick_Pid�      ��                                                                        ���pid�ԅscid�ԅname�Ӄ�_ENV�SCIDFriends�SessionPlayers��� Ҏ     �  DB  8" �  � DB  � �  � DB  8 � B�  8 �  � D� <� � � B  �  �G 8 �  � D� <� � � B  � �  � D� < 8	 �  D�� � � ��� �  	� D 
� D � D  D G G ��player�is_player_valid�is_player_friend�ScriptConfig�NotKick_Friends�get_player_scid �player_id�Namez�get_player_name�Blacklist_Check_Player�Blacklist_Check_PlayerIP�PlayerCount�player_count�    ��                                                                     ���e�҄pid�҂�_ENV�SCIDFriends�                                  �        �   �                                   
�
        ��
   ����$���#�����(�      �     �        
�
        
�
        
�
       �            �   �    �     �#�%     �     ��������A�D�     �     �       
�
       
�
       �       �  ��  ���������SessionPlayers��BL_Notify��BL_M_Notify��BLIPNotify��Blacklist_Feature_Enabled��Blacklist_Mark_As_Modder_Feature��Blacklist_Kick_IP_Feature��Blacklist_Kick_Feature��Blacklist_Remove_Feature��Blacklist_Remove_IP_Blacklist_Feature��IPs��IPN��pIPs��pIPsN��intFlags��M_Func��SCIDFriends��(for state)���(for state)���(for state)���pid���(for state)�Ì(for state)�Ì(for state)�Äpid�(for state)���(for state)���(for state)���pid����_ENV�                             ���    ����������_ENV