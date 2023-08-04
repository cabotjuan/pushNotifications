import React, {useEffect, useState} from 'react';
import {SafeAreaView, StyleSheet, Text, View, Platform} from 'react-native';
import messaging, {
  FirebaseMessagingTypes,
} from '@react-native-firebase/messaging';

const BASE_URL = 'http://192.168.0.179:3000';
const USER_ID = 1; // Account Managment is OUT OF SCOPE.

const getFirebaseToken = async () => {
  await messaging().registerDeviceForRemoteMessages();
  const generatedToken = await messaging().getToken();
  return generatedToken;
};

const registerDevice = async (token: string) => {
  const payload = {device: {user_id: USER_ID, device_type: Platform.OS, token}};
  try {
    const response = await fetch(`${BASE_URL}/devices/create`, {
      method: 'POST',
      mode: 'cors',
      headers: {'Content-Type': 'application/json'},
      body: JSON.stringify(payload),
    });
    if (response.status === 201 || response.status === 200) {
      console.log('dispositivo registrado!');
    } else {
      console.log('No se pudo registrar el dispositivo.');
    }
  } catch (e) {
    console.log('No se pudo hacer fetch');
    console.log(e);
  }
};

const App = () => {
  const [notificationMessage, setNotificationMessage] =
    useState<FirebaseMessagingTypes.RemoteMessage>();

  useEffect(() => {
    async function fetchData() {
      const generatedToken = await getFirebaseToken();
      registerDevice(generatedToken);
    }
    fetchData();
    messaging().setBackgroundMessageHandler(async remoteMessage => {
      setNotificationMessage(remoteMessage);
    });
  }, []);

  return (
    <SafeAreaView style={styles.wrapper}>
      {notificationMessage ? (
        <Text style={styles.greenText}>
          Ingreso desde la notificacion:
          {notificationMessage.notification?.title} -
          {notificationMessage.notification?.body}
        </Text>
      ) : null}
      <Text>Prueba de Concepto - Notifiaciones Push</Text>
      <View style={styles.buttonsWrapper}>
        <View style={styles.notificationsList}>
          <Text>TODO: Notificaciones in-app 🔔</Text>
        </View>
      </View>
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  wrapper: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    padding: 20,
    backgroundColor: 'white',
  },
  buttonsWrapper: {
    marginTop: 50,
  },
  buttonWrapper: {
    marginBottom: 20,
  },
  notificationsList: {
    padding: 16,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#0000001f',
  },
  greenText: {
    fontSize: 20,
    color: 'green',
    fontWeight: 'bold',
  },
});

export default App;
