function varargout = differencemap(varargin)
% DIFFERENCEMAP MATLAB code for differencemap.fig
%      DIFFERENCEMAP, by itself, creates a new DIFFERENCEMAP or raises the existing
%      singleton*.
%
%      H = DIFFERENCEMAP returns the handle to a new DIFFERENCEMAP or the handle to
%      the existing singleton*.
%
%      DIFFERENCEMAP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DIFFERENCEMAP.M with the given input arguments.
%
%      DIFFERENCEMAP('Property','Value',...) creates a new DIFFERENCEMAP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before differencemap_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to differencemap_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help differencemap

% Last Modified by GUIDE v2.5 24-Dec-2014 23:52:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @differencemap_OpeningFcn, ...
                   'gui_OutputFcn',  @differencemap_OutputFcn, ...
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


% --- Executes just before differencemap is made visible.
function differencemap_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to differencemap (see VARARGIN)

% Choose default command line output for differencemap
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
k=getappdata(0,'LinkDataPreTransform');
set(handles.uitable1,'Data',k);
r=getappdata(0,'copycount');
set(handles.count,'String',r);
% UIWAIT makes differencemap wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = differencemap_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function uitable1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called





% --- Executes on button press in copybutton.
function copybutton_Callback(hObject, eventdata, handles)
% hObject    handle to copybutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
d=get(handles.uitable1,'Data');
clipboard ( 'copy', d );
filename = 'DifferenceMapOutput';
val=get(handles.count,'String');
status=xlswrite(filename,d,val);
[lastmsg,lastid] = lastwarn;
warning('off',lastid);
if status==1
    k=str2num(val)+1;
    str=sprintf('Copied to file ''DifferenceMapOutput.xlsx'' in sheet number %d',k);
    msgbox(str);
elseif status==0
    msgbox('Unsuccesful write to Excel file')
end
set(handles.count,'String',k);
copynumber=get(handles.count,'String');
setappdata(0,'copycount',copynumber);


% --- Executes on button press in donebutton.
function donebutton_Callback(hObject, eventdata, handles)
% hObject    handle to donebutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcf);


% --- Executes during object creation, after setting all properties.
function count_CreateFcn(hObject, eventdata, handles)
% hObject    handle to count (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
