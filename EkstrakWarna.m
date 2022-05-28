function varargout = EkstrakWarna(varargin)
% EKSTRAKFITUR MATLAB code for EkstrakWarna.fig
%      EKSTRAKWARNA, by itself, creates a new EKSTRAKWARNA or raises the existing
%      singleton*.
%
%      H = EKSTRAKWARNA returns the handle to a new EKSTRAKWARNA or the handle to
%      the existing singleton*.
%
%      EKSTRAKWARNA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EKSTRAKWARNA.M with the given input arguments.
%
%      EKSTRAKWARNA('Property','Value',...) creates a new EKSTRAKWARNA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before EkstrakWarna_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to EkstrakWarna_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help EkstrakWarna

% Last Modified by GUIDE v2.5 28-May-2022 15:53:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @EkstrakWarna_OpeningFcn, ...
                   'gui_OutputFcn',  @EkstrakWarna_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before EkstrakFitur is made visible.
function EkstrakWarna_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to EkstrakWarna (see VARARGIN)

% Choose default command line output for EkstrakWarna
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes EkstrakWarna wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = EkstrakWarna_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
open=guidata(gcbo);
[namafile]=uigetfile({'*.jpg;*.bmp;*.tif;*.png'},'openimage');
I=imread(namafile);
set(open.figure1,'CurrentAxes',open.axes1);
set(imagesc(I));colormap('gray');
set(open.axes1,'Userdata',I);

function editRed_Callback(hObject, eventdata, handles)
% hObject    handle to editRed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editRed as text
%        str2double(get(hObject,'String')) returns contents of editRed as a double


% --- Executes during object creation, after setting all properties.
function editRed_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editRed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editGreen_Callback(hObject, eventdata, handles)
% hObject    handle to editGreen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editGreen as text
%        str2double(get(hObject,'String')) returns contents of editGreen as a double


% --- Executes during object creation, after setting all properties.
function editGreen_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editGreen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
open=guidata(gcbo);
E=get(open.axes1,'Userdata');
fR=E(:,:,1);
fG=E(:,:,2);
fB=E(:,:,3);
fr=mean(mean(fR));
fb=mean(mean(fG));
fc=mean(mean(fB));
frr=fr/255;
fbb=fb/255;
fcc=fc/255;
total=(frr+fbb+fcc)/3;
h=(frr+fbb+fcc);
set(handles.editRed,'String',frr)
set(handles.editGreen,'String',fbb)
set(handles.editBlue,'String',fcc)
set(handles.editHasil,'String',h)



function editBlue_Callback(hObject, eventdata, handles)
% hObject    handle to editBlue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editBlue as text
%        str2double(get(hObject,'String')) returns contents of editBlue as a double


% --- Executes during object creation, after setting all properties.
function editBlue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editBlue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editHasil_Callback(hObject, eventdata, handles)
% hObject    handle to editHasil (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editHasil as text
%        str2double(get(hObject,'String')) returns contents of editHasil as a double


% --- Executes during object creation, after setting all properties.
function editHasil_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editHasil (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
